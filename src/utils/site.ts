/**
 * Single source of truth for the deploy subpath (`base` in astro.config.mjs).
 * Author-written absolute URLs (nav links, public/ assets, meta tags) do not
 * get the base prefixed automatically, so route them through here instead of
 * hardcoding the subpath across components.
 */
const BASE = import.meta.env.BASE_URL.replace(/\/$/, '');

export function withBase(path: string): string {
  if (!path.startsWith('/')) return `${BASE}/${path}`;
  return `${BASE}${path}`;
}
