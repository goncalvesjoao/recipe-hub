# RecipeHub

A reference implementation of a **recipe sharing platform**, built across multiple web frameworks.

The goal of this repository is to explore how the same product requirements can be implemented using different stacks (e.g., Rails, Next.js, Django), while keeping **domain logic and UX consistent**.

---

## Core Concepts

- Users can create and share recipes
- Recipes are composed of ingredients
- Users can like recipes
- Profiles aggregate user contributions

---

## Domain Model

### User

- `email: string`
- `name: string`
- `belongs_to :avatar`
- `has_many :recipes`
- `has_many :recipe_user_likes`

---

### Recipe

- `name: string`
- `steps: text`
- `preparation_time_seconds: integer`
- `cooking_time_seconds: integer`
- `belongs_to :user`
- `has_many :recipe_ingredients`
- `has_many :recipe_user_likes`

---

### RecipeUserLike

- `belongs_to :user`
- `belongs_to :recipe`

**Constraints:**

- `(user_id, recipe_id)` must be unique

---

### RecipeIngredient

- `quantity: number`
- `measuring_unit: string`
- `belongs_to :recipe`
- `belongs_to :ingredient`

---

### Ingredient

- `name: string`

---

## UI Specification

### Global Layout

#### Navigation Bar

- Left: Application name
- Right:
  - **Unauthenticated:** Login, Sign Up
  - **Authenticated:** Avatar dropdown:
    - Create Recipe
    - My Recipes
    - My Profile
    - My Account
    - Log out

#### Footer

- MIT License reference
- Link to GitHub repository

---

## Pages

### Home (`/`)

- Redirects to `/recipes`

---

### Sign Up (`/sign_up`)

- Public page
- Fields:
  - Name
  - Email
  - Password
  - Password confirmation
- On success:
  - User is authenticated
  - Redirect to `/recipes`

---

### Login (`/login`)

- Public page
- Fields:
  - Email
  - Password
- On success:
  - Redirect to previous page or `/recipes`

---

### Recipes (`/recipes`)

- Lists all recipes (see *Recipe Listing Rules*)

---

### Recipe Details (`/recipes/:recipe_id`)

- Shows:
  - Name
  - Image
  - Ingredients
  - Steps
  - Total likes
  - Like/Unlike button (auth required)
  - Author avatar → links to profile
- Back button (referrer-aware, fallback to `/`)

**If owner:**

- Edit link

---

### Create Recipe (`/recipes/new`)

- Requires authentication

**Fields:**

- Name
- Preparation time (seconds)
- Cooking time (seconds)
- Image (optional)
- Steps
- Ingredients (dynamic list):
  - Ingredient
  - Quantity
  - Measuring unit

**Behavior:**

- Can add/remove ingredients dynamically
- On success:
  - Redirect to `/recipes/:id`

---

### Edit Recipe (`/recipes/:recipe_id/edit`)

- Requires authentication
- Only accessible by owner
- Same fields as Create Recipe

---

### User Profile (`/users/:user_id`)

- Public page
- Shows:
  - Name
  - Avatar
  - Number of recipes
  - Total likes received
  - Recipe list (see *Recipe Listing Rules*)

**If owner:**

- Edit profile link

---

### My Profile (`/users/me`)

- Same as User Profile for current user

---

### Edit Profile (`/users/me/edit`)

- Requires authentication

**Fields:**

- Name
- Avatar

---

### My Account (`/users/me/account`)

- Requires authentication

**Features:**

- Change password
- Delete account

---

### User Recipes (`/users/:user_id/recipes`)

- Public page
- Lists user recipes (see *Recipe Listing Rules*)

---

## Recipe Listing Rules

- Pagination: **20 items per page**
- Sorting: **Descending by number of likes**

Each recipe item shows:

- Name
- Image
- Author avatar (links to profile)
- Like/Unlike button (auth required)
- “See more” → Recipe Details

**If owner:**

- Edit link
- Delete button

---

## User Stories

### US-001 — User Login

**As a** visitor
**I want to** log into my account
**So that** I can interact with recipes

---

### US-002 — Browse Recipes

**As a** visitor
**I want to** browse recipes
**So that** I can discover popular dishes

---

### US-003 — View Recipe Details

**As a** visitor
**I want to** view full recipe details
**So that** I can cook it

---

### US-004 — Like a Recipe

**As an** authenticated user
**I want to** like a recipe
**So that** I can express appreciation

---

### US-005 — Create Recipe

**As an** authenticated user
**I want to** create a recipe
**So that** I can share it

---

### US-006 — Edit Recipe

**As a** recipe owner
**I want to** edit my recipe
**So that** I can improve it

---

### US-007 — Delete Recipe

**As a** recipe owner
**I want to** delete my recipe
**So that** I can remove it

---

### US-008 — View User Profile

**As a** visitor
**I want to** view a user profile
**So that** I can see their contributions

---

### US-009 — Edit Profile

**As an** authenticated user
**I want to** edit my profile
**So that** I can update my information

---

### US-010 — Manage Account

**As an** authenticated user
**I want to** manage my account
**So that** I can maintain security

---

### US-011 — Back Navigation

**As a** user
**I want to** return to the previous page
**So that** navigation feels natural

---

### US-012 — User Sign Up

**As a** visitor
**I want to** create an account
**So that** I can participate in the platform

---

### US-013 — Redirect After Authentication

**As a** user
**I want to** return to my previous page after login/signup
**So that** my flow is uninterrupted

---

### US-014 — Dynamic Ingredients

**As an** authenticated user
**I want to** add/remove ingredients dynamically
**So that** I can accurately define recipes

---

### US-015 — Authorization Enforcement

**As a** system
**I want to** restrict certain actions to authenticated users
**So that** ownership and integrity are preserved

---

## License

MIT License
