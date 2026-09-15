# Implementation Plan: Cinematic Portfolio (Astro Rebuild) — Foundation & Hero Section

Build the initial foundation for **Girish Lade's Cinematic Documentary Portfolio** using Astro 5, Tailwind CSS, and GSAP. Following the user's instructions, this phase focuses on scaffolding the Astro project structure, establishing the cinematic design system (letterbox, grain, vignette, color grading), and delivering the **Fullscreen Hero Section end-to-end** (poster frame + video background + GSAP SplitText reveal) before implementing subsequent pages.

---

## User Review Required

> [!IMPORTANT]
> Please review the proposed visual styling choices and open questions below before we scaffold the project and build the hero. Once confirmed, we will initialize the Astro codebase and construct the hero experience.

### Design Recommendations for the "Cinematic Documentary" Identity:
1. **Color Grade (Monochrome Film & Anamorphic Accent)**:
   - Base: Deep 35mm obsidian black (`#090A0C` / `#0D0E12`)
   - Surface/Cards: Smoked glass (`rgba(255, 255, 255, 0.03)` with backdrop blur)
   - Typography: Warm paper white (`#F3F3F6`) and muted slate (`#8A8F98`)
   - Accent: Warm amber/titanium (`#E2B774` or subtle anamorphic blue `#4E89FF`)
2. **Typography**:
   - Display/Titles: Editorial Grotesk / Modern Industrial (e.g., `Syne` or `Space Grotesk` or `Cabinet Grotesk` via Google Fonts)
   - Body & Mono: `Inter` / `Geist` + `JetBrains Mono` for tech specs and documentary timestamps (e.g., `REC [00:00:00]`, `LAT/LON`, `FPS 24`)
3. **Cinematic Framing & Overlays**:
   - Top & bottom letterbox bars (subtle 28px - 36px anamorphic bars)
   - SVG procedural film grain (subtle 3.5% opacity, hardware-accelerated, zero battery drain)
   - Radial vignette darkening the peripheral edges like a 35mm lens
   - Respects `prefers-reduced-motion` to skip character animations and heavy transitions.

---

## Open Questions

> [!WARNING]
> Please provide your preferences or confirm the recommended defaults:

1. **Color Palette & Tone Preference**:
   - **Option A (Recommended - Dark Anamorphic Minimalist)**: Pure pitch obsidian blacks (`#09090b`), titanium silver text, icy slate borders, restrained amber accent for founder/status badges.
   - **Option B (Warm 35mm Kodak Documentary)**: Charcoal graphite (`#121214`), warm cream/ivory text, sepia/bronze accents.
2. **Typography Pairing**:
   - **Option A (Recommended - Modern Editorial & Engineering)**: `Syne` / `Space Grotesk` for cinematic headings + `Inter` for body + `JetBrains Mono` for documentary timestamps/metadata.
   - **Option B (Ultra-Clean Swiss Industrial)**: `Geist` / `Inter` throughout with strict typographic weight contrasts.
3. **Hero Video & Poster Asset**:
   - For the initial build, should we provide a high-quality, lightweight cinematic dark atmospheric tech/mechanical video loop (compressed MP4/WebM + matching WebP poster frame) into `public/assets/hero/`, which you can easily swap with your own custom reel later?
4. **Letterbox Framing Style**:
   - **Option A (Recommended - Fixed Anamorphic Frame)**: Sleek permanent top/bottom matte bars (28px) with subtle corner framing markers (`[+]` / `REC 24FPS`).
   - **Option B (Hero-Only Letterbox)**: Letterbox bars expand and contract dynamically during the hero sequence.

---

## Proposed Changes

### Project Scaffolding & Setup

#### [NEW] Astro Project Files:
- `package.json`: Astro 5, Tailwind CSS, GSAP (`gsap`), Lenis (`@studio-freight/lenis` or `lenis`), Lucide icons.
- `astro.config.mjs`: Astro configuration with Tailwind integration and Vite optimizations.
- `tailwind.config.mjs`: Cinematic color palette, aspect ratio utilities, typography configurations.
- `tsconfig.json`: Strict TypeScript settings.

---

### Cinematic Layout & Core Design System

#### [NEW] [src/layouts/BaseLayout.astro](file:///c:/Users/Girish%20Lade/OneDrive/Desktop/ASPOR/src/layouts/BaseLayout.astro)
- HTML document head, SEO metadata tags, modern Google Fonts preconnect (`Syne`, `Inter`, `JetBrains Mono`).
- Global fixed cinematic overlays:
  - Procedural SVG film grain overlay (`mix-blend-overlay`, pointer-events-none).
  - Vignette overlay (`radial-gradient` shading corners).
  - Anamorphic letterbox bars (top and bottom matte frames).
- Smooth scroll container (Lenis initialization script).
- Minimalist cinematic navigation header (Girish Lade monogram, sound/status reel indicator, discreet nav links).

#### [NEW] [src/styles/global.css](file:///c:/Users/Girish%20Lade/OneDrive/Desktop/ASPOR/src/styles/global.css)
- Tailwind directives and custom utility classes.
- Film grain animation, letterbox styling, reduced-motion rules.
- Custom scrollbar and selection styles.

---

### Hero Section Component

#### [NEW] [src/components/Hero.astro](file:///c:/Users/Girish%20Lade/OneDrive/Desktop/ASPOR/src/components/Hero.astro)
- **Background Layer**:
  - Fullscreen video element (`autoplay`, `muted`, `loop`, `playsinline`, `preload="metadata"`).
  - High-res instant poster fallback image to eliminate any blank or white flash on initial render.
  - Subtle dark gradient scrim overlay for high contrast text readability.
- **Documentary Framing HUD**:
  - Discreet documentary metadata: e.g., `FRAME 001 // DIR. GIRISH LADE`, `STATUS: FOUNDER @ LADESTACK`, `LOCATION: PUNE, IN`.
- **Title & Narrative Reveal Layer**:
  - Impactful headline: e.g. "ENGINEERING BY INSTINCT. SOFTWARE BY CRAFT." / "SOLO FOUNDER & SOFTWARE ENGINEER".
  - Character/word reveal using GSAP (SplitText logic / staggered reveal animation).
  - Sub-headline and quick status badge ("Solo Founder @ LadeStack • Available for select engineering roles").
  - Subtle scroll indicator ("SCROLL TO ADVANCE // 01").
- **Graceful Fallbacks**:
  - Full support for `prefers-reduced-motion` (immediate opacity fade instead of stagger motion).

#### [NEW] [src/pages/index.astro](file:///c:/Users/Girish%20Lade/OneDrive/Desktop/ASPOR/src/pages/index.astro)
- Root index page mounting `BaseLayout` and `Hero`.

---

## Verification Plan

### Automated / Tool Verification
- Run `npm install` and verify all dependencies install cleanly without peer dependency conflicts.
- Run `npm run build` to ensure zero SSR or TypeScript compilation errors.
- Run `npm run dev` and test responsiveness and runtime errors in the local server.

### Manual / Browser Verification
- Open in browser using browser tool or local preview:
  1. **Instant Paint Test**: Verify the poster image renders immediately before video load.
  2. **Video Autoplay**: Verify muted autoplay starts smoothly without layout shifts.
  3. **GSAP Animation**: Verify the title reveal animation triggers smoothly after load.
  4. **Cinematic Overlays**: Verify the letterbox bars, film grain, and vignette look cohesive and elegant without obstructing text or interactions.
  5. **Reduced Motion**: Verify that setting `prefers-reduced-motion: reduce` gracefully simplifies animations into gentle fades.
