import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

// Project Case Studies Content Collection Schema
const projects = defineCollection({
  loader: glob({ pattern: '**/*.{md,mdx}', base: './src/content/projects' }),
  schema: z.object({
    title: z.string({ required_error: 'Project title is required' }),
    slug: z.string({ required_error: 'Project slug is required for URLs' }),
    summary: z.string({ required_error: 'Project summary is required' }),
    tags: z.array(z.string()).min(1, 'At least one tech stack tag is required'),
    githubUrl: z.string().url('Invalid GitHub URL').optional(),
    youtubeId: z.string().optional(),
    thumbnailImage: z.string({ required_error: 'Thumbnail image path is required' }),
    previewVideo: z.string().optional(),
    screenshots: z.array(z.string()).optional().default([]),
    featured: z.boolean().optional().default(false),
    order: z.number().optional().default(999),
  }),
});

export const collections = {
  projects,
};
