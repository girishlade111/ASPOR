# ASPOR

A cinematic, letterbox-styled personal portfolio website — modern, performant, and fully static. Built with **Astro**, **Tailwind CSS v4**, **GSAP**, and **Lenis** smooth scrolling, featuring a project content collection, SEO meta tags, and an XML sitemap.

**Live site:** https://girishlade111.github.io/ASPOR/

## Features

- 🎬 **Cinematic overlay / letterbox UI** — distinctive film-frame aesthetic across every page
- 🏠 **Pages** — Home (hero), About, Work (project listing + per-project detail pages), Stack, Contact
- 📚 **Project content collection** — add projects as Markdown/MDX files under `src/content/projects/`
- ✨ **Motion** — GSAP-powered entrance animations and Lenis buttery smooth scrolling
- 🔍 **SEO-ready** — per-page meta tags, Open Graph tags, `sitemap` integration with a styled, human-readable XSL rendering
- ⚡ **Zero-JS-by-default** — Astro islands architecture; ships almost no client JavaScript
- 📱 **Responsive** — mobile-first Tailwind utility styling

## Tech stack

| Layer | Tool |
|---|---|
| Framework | [Astro](https://astro.build) 7.x (static output) |
| Styling | Tailwind CSS v4 (`@tailwindcss/vite`) |
| Content | Astro Content Collections + `@astrojs/mdx` |
| SEO | `@astrojs/sitemap` with styled XSL |
| Animation | GSAP 3, Lenis |
| TypeScript | Strict mode (`astro check` compatible) |
| Hosting | GitHub Pages (project site at `/ASPOR` subpath) |

## Quick start

```sh
# Requirements: Node.js >= 22.12
npm install
npm run dev      # dev server at http://localhost:4321
npm run build    # production build → ./dist/
npm run preview  # preview the production build locally
```

## Project structure

```text
/
├── public/                 # static assets (favicon, sitemap.xsl, images)
│   └── sitemap.xsl         # styled rendering for the XML sitemap
├── src/
│   ├── components/         # CinematicOverlay, Header, Hero
│   ├── content/projects/   # project MD/MDX entries (content collection)
│   ├── layouts/            # BaseLayout (SEO meta tags, letterbox UI)
│   ├── pages/              # index, about, work, work/[slug], contact, stack
│   └── utils/site.ts       # base-path helper (single source of truth for /ASPOR)
├── astro.config.mjs        # site + base ('/ASPOR') for GitHub Pages project sites
└── package.json
```

## Adding a project

Create `src/content/projects/my-project.md` with frontmatter (`title`, `description`, `tags`, …) — the Work listing and detail pages pick it up automatically on the next build.

## Deploy notes

This is a **fully static site** — no server, no API routes, no environment variables.

- The `base: '/ASPOR'` setting in `astro.config.mjs` and the `withBase()` helper in `src/utils/site.ts` keep every author-written absolute URL correct on the GitHub Pages project subpath. Never hardcode `/ASPOR` in components — always go through `withBase()`.
- `site: 'https://girishlade111.github.io'` feeds the sitemap generator absolute canonical URLs.
- Deploy flow: `npm run build` → publish `dist/` to the `gh-pages` branch → GitHub Pages serves it at https://girishlade111.github.io/ASPOR/.

## License

All rights reserved. Built by [Girish Lade](https://ladestack.in).
