import fs from 'node:fs';
import path from 'node:path';
import { defineConfig, type Connect, type Plugin } from 'vite';

function isHtmlNavigationRequest(req: Connect.IncomingMessage) {
  const method = req.method ?? 'GET';

  if (method !== 'GET' && method !== 'HEAD') {
    return false;
  }

  const accept = req.headers.accept ?? '';
  return accept === '' || accept.includes('text/html') || accept.includes('*/*');
}

function resolveStaticHtmlFile(baseDir: string, url: string) {
  const pathname = decodeURIComponent(new URL(url, 'http://localhost').pathname);

  if (pathname === '/' || /\.[^/]+$/.test(pathname)) {
    return null;
  }

  const normalizedPath = pathname.replace(/\/+$/, '');
  const candidates = [
    `${normalizedPath}.html`,
    path.posix.join(normalizedPath, 'index.html'),
  ];

  for (const candidate of candidates) {
    const filePath = path.join(baseDir, candidate.slice(1));

    if (fs.existsSync(filePath) && fs.statSync(filePath).isFile()) {
      return filePath;
    }
  }

  return null;
}

function createStaticHtmlMiddleware(baseDir: string): Connect.NextHandleFunction {
  return (req, res, next) => {
    if (!req.url || !isHtmlNavigationRequest(req)) {
      next();
      return;
    }

    const filePath = resolveStaticHtmlFile(baseDir, req.url);

    if (!filePath) {
      next();
      return;
    }

    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/html; charset=utf-8');

    if (req.method === 'HEAD') {
      res.end();
      return;
    }

    fs.createReadStream(filePath).pipe(res);
  };
}

function staticHtmlRoutesPlugin(): Plugin {
  return {
    name: 'static-html-routes',
    configureServer(server) {
      const publicDir = path.resolve(server.config.root, server.config.publicDir);
      server.middlewares.use(createStaticHtmlMiddleware(publicDir));
    },
    configurePreviewServer(server) {
      const distDir = path.resolve(server.config.root, server.config.build.outDir);
      server.middlewares.use(createStaticHtmlMiddleware(distDir));
    },
  };
}

export default defineConfig({
  appType: 'mpa',
  plugins: [staticHtmlRoutesPlugin()],
});
