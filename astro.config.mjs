// @ts-check
import { defineConfig } from 'astro/config';
import tailwindcss from '@tailwindcss/vite';
import mdx from '@astrojs/mdx';
import sitemap from '@astrojs/sitemap';

// https://astro.build/config
export default defineConfig({
  // Project-site deployment: https://girishlade111.github.io/ASPOR/
  // `site` is the origin; `base` is the subpath (kept in ONE place and
  // consumed via src/utils/site.ts — never hardcode /ASPOR in components).
  site: 'https://girishlade111.github.io',
  base: '/ASPOR',
  integrations: [
    mdx(),
    sitemap({
      // Styled, human-readable rendering when the XML is opened in a browser.
      // Absolute so it resolves correctly on the project subpath.
      // public/sitemap.xsl is copied to dist root on build.
      xslURL: '/ASPOR/sitemap.xsl',
    }),
  ],
  vite: {
    plugins: [tailwindcss()],
  },
});
