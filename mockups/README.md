# Mockups

This folder contains the static HTML mockups for the Recipe Hub pages described in the repository root README.

## Purpose

- Keep a simple set of static pages to act as a guide for the different implementations

## Requirements

- Node.js
- npm

## Install

```bash
npm install
```

## Run

Start the development server:

```bash
npm run dev
```


## Route Mapping

The mockups are stored as static HTML files in `public/`.

Examples:

- `/login` -> `public/login.html`
- `/sign_up` -> `public/sign_up.html`
- `/recipes` -> `public/recipes/index.html`
- `/recipes/1` -> `public/recipes/1.html`
- `/recipes/1/edit` -> `public/recipes/1/edit.html`
- `/users/me` -> `public/users/me/index.html`

Vite does not resolve these clean routes automatically when pages live under `public/`, so `vite.config.ts` includes a small middleware that maps:

- `/path` -> `public/path.html`
- `/path` -> `public/path/index.html`
