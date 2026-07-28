# Hackability

Building Future-Ready Talent for Tomorrow.

Hackability partners with higher education institutions to build future-ready talent. We deliver industry-aligned training programs in innovation, emerging technologies, and in-demand skills through workshops, bootcamps, hands-on learning, and customized industry-academia initiatives.

## 🚀 Overview

This is the main website repository for Hackability. It is built as a highly optimized, purely static HTML, CSS, and JavaScript site to ensure maximum performance, instant load times, and easy hosting without any build steps or complex dependencies.

### Features

- **Pure Static HTML/CSS/JS**: Zero build steps required. No framework overhead.
- **Custom Design System**: Utilizes a centralized CSS architecture (`design-system.css`).
- **Responsive Layouts**: Fully responsive across mobile, tablet, and desktop devices.
- **Optimized Assets**: Optimized imagery and correctly sized favicons for SEO and presentation.

## 📂 Project Structure

- `index.html` - The main landing page.
- `about.html` - About Us.
- `hackability.html` - Hackability (Higher Ed) details.
- `blog.html` - Blog & Insights.
- `partners.html` - Partner ecosystem.
- `assets/` - Images, videos, and icons used across the site.
- `css/` - Core stylesheets (`design-system.css`, `logoloop.css`).
- `js/` - Interactive functionality (`animations.js`, `main.js`, `card-nav.js`, etc.).

## 🛠️ Getting Started (Local Development)

Because this is a pure static site, you don't need `npm install` or a build process to run it. You just need a basic local web server to serve the HTML files.

### Using Python (Recommended)
If you have Python installed, you can easily spin up a local server:

```bash
# Navigate to the project directory
cd Hackability

# Run a local HTTP server
python -m http.server 3000
```
Then open `http://localhost:3000` in your browser.

### Using Node.js (npx)
If you prefer Node.js tools:
```bash
npx serve .
```

## 🌐 Deployment

This project can be deployed instantly to any static hosting provider (e.g., Vercel, Netlify, GitHub Pages, Firebase Hosting) without configuring any build commands. Simply set the publish directory to the root of this repository.

## 📄 License

© 2026 Hackability. All rights reserved.
