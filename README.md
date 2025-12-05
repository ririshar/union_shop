# Union Shop (Flutter Coursework)

This is my coursework project for the **Union Shop** e‑commerce site, built with Flutter for the University of Portsmouth modules:

- Programming Applications and Programming Languages (M30235)
- User Experience Design and Implementation (M32605)

The goal is to recreate key parts of [shop.upsu.net](https://shop.upsu.net) using Flutter, focusing on functionality, navigation and basic UX rather than pixel‑perfect design.

---

## Features Implemented

### Navigation & Layout

- Top navigation bar (`TopHeader`) with:
  - Logo link back to homepage
  - Menu items (Home, Shop, The Print Shack, Sale!, About)
  - Shop dropdown with links into collections (e.g. Clothing, Merchandise, Graduation)
- Footer (`AppFooter`) with simple information and links
- Named routes between pages (`/`, `/about`, `/shop/clothing`, `/shop/merchandise`, `/product`, etc.)

### Homepage

- Hero section with Union Shop branding
- “Our range” area with navigation tiles (Graduation, Merchandise, Clothing, Contact / Info)
- Grid of highlighted products using `ProductCard`
- All tiles and cards navigate to the appropriate collection or product page

### Collections / Listing Pages

I have implemented dynamic collection pages populated from data models:

- **Clothing page** (`lib/clothing_page.dart`)
  - Uses a `Product` model (title, price, image, category, colour, size, soldOut)
  - Grid of clothing items (hoodies and t‑shirts)
  - Filters for:
    - Type (e.g. Hoodie, T‑Shirt)
    - Colour
  - Filters work by updating state and re‑rendering the grid

- **Merchandise page** (`lib/merchandise_page.dart`)
  - Similar structure to Clothing page
  - Products include ID holders, lanyards, bags, pens, lapel pin, graduation items, etc.
  - Filters:
    - Type/category (Accessories, Gifts, Bags, Stationery, etc.)
    - Colour
  - Sort options:
    - Best selling (original order)
    - Price: Low to High
    - Price: High to Low
    - Alphabetically, A–Z
  - Uses the same `Product` model and shared `ProductFilters` widget

Both pages:

- Use `ProductCard` so product tiles are consistent across the app
- Show discounted prices when `originalPrice` is set (crossed‑out original + new price)

### Product Pages

- Dedicated product detail screen (`lib/product_page.dart`)
- Navigated to via named route `/product`, with strongly typed arguments `ProductDetailArgs`
- Data passed from `ProductCard` → `openProductPage` → `ProductPage`
- Layout:
  - Shared header (`TopHeader`) and footer (`AppFooter`) so product pages match the rest of the site
  - Left: main product image
  - Right: title, price, optional original price, dropdowns and “Add to basket” button
  - Below: sections for description, features and care instructions

#### Per‑product customisation

`ProductCard` contains logic in `onTap` that fills in `ProductDetailArgs` differently for each product, for example:

- **Limited Edition Essential Zip Hoodie**
  - Has size and colour dropdowns
  - Custom description and feature bullet points
  - Care instructions
- **Essential T‑Shirt / Signature Hoodie / Signature T‑Shirt**
  - Clothing‑relevant text, sizes (XS–XL), colours, and care instructions
- **Portsmouth City Postcard / Magnet / Notebook / Bookmark**
  - Stationery / gift‑style descriptions
  - No size/colour dropdowns when not relevant (empty lists)
  - Magnet and other items have appropriate “features” text

#### Sold‑out handling

- `ProductDetailArgs` has a `soldOut` flag.
- When `soldOut` is `true`:
  - “SOLD OUT” label appears next to the price
  - Size / colour dropdowns are disabled
  - The main button becomes a disabled `SOLD OUT` button (cannot add to basket)
- Example: “Portsmouth City Bookmark” is marked as sold out and behaves accordingly.

---

## Code Structure

Key files and directories:

```plaintext
lib/
├── main.dart                # App entry, routes, homepage, shared widgets (TopHeader, AppFooter, ProductCard, NavSquare, etc.)
├── product_page.dart        # Product detail page (uses ProductDetailArgs)
├── clothing_page.dart       # Clothing collection page with filters
├── merchandise_page.dart    # Merchandise collection page with filters & sorting
├── models/
│   └── product.dart         # Product model used for listings (title, price, imageUrl, category, colour, size, soldOut)
└── widgets/
    └── product_filters.dart # Reusable filter widget for type/colour dropdowns
```

The app uses:

- A `Product` model for listing pages (collections)
- `ProductDetailArgs` for the product detail route
- `ProductCard` to render product tiles and handle navigation to the detail page
- A shared `ProductFilters` widget to provide consistent filtering UI

---

## Running the App

### Requirements

- Flutter SDK (tested with the stable channel)
- Chrome installed (for web target)
- VS Code or another editor with Flutter support

Install dependencies:

```bash
flutter pub get
```

Run on Chrome (recommended, mobile view in DevTools):

```bash
flutter run -d chrome
```

In Chrome:

1. Open DevTools (F12 or right‑click → Inspect).
2. Toggle the device toolbar.
3. Pick a mobile preset (e.g. iPhone 12) to view the layout as a phone.

---

## Notes & Limitations

- The app focuses on **functionality and structure**, not pixel‑perfect styling.
- Images are local assets and/or placeholders, not exact images from the live site.
- “Add to basket” currently only shows a `SnackBar` and does not persist data (no full cart system yet).
- Authentication, search and full cart management are not fully implemented but could be added later to target advanced marks.

---

## Development Practices

- Code is formatted with `dart format`.
- I use a small, reusable widget and model structure (`Product`, `ProductCard`, `ProductFilters`, `TopHeader`, `AppFooter`) to keep repetition low.
- Changes are committed regularly to Git with descriptive commit messages.

If you are marking this coursework and want to see specific features demonstrated (e.g. filters, sold‑out behaviour, navigation), please start from the homepage and I can walk through each route.
