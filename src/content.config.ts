import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

// Project Case Studies Content Collection Schema
const projects = defineCollection({
  loader: glob({ pattern: '**/*.{md,mdx}', base: './src/content/projects' }),
  // `image()` validates local images and enables Astro's responsive optimization
  // pipeline (<Image />). Frontmatter paths must be relative to the MDX file.
  schema: ({ image }) =>
    z.object({
    title: z.string({ required_error: 'Project title is required' }),
    slug: z.string({ required_error: 'Project slug is required for URLs' }),
    summary: z.string({ required_error: 'Project summary is required' }),
    tags: z.array(z.string()).min(1, 'At least one tech stack tag is required'),
    githubUrl: z.string().url('Invalid GitHub URL').optional(),
    youtubeId: z.string().optional(),
    thumbnailImage: image(),
    previewVideo: z.string().optional(),
    screenshots: z.array(image()).optional().default([]),
    featured: z.boolean().optional().default(false),
    order: z.number().optional().default(999),
  }),
});

export const collections = {
  projects,
};
