import { getCollection, type CollectionEntry } from 'astro:content';

export type ProjectEntry = CollectionEntry<'projects'>;

/**
 * Retrieves all projects from the 'projects' content collection,
 * sorted deterministically by `order` ascending, then alphabetically by `title`.
 */
export async function getAllProjects(): Promise<ProjectEntry[]> {
  const projects = await getCollection('projects');
  
  return projects.sort((a, b) => {
    const orderA = a.data.order ?? 999;
    const orderB = b.data.order ?? 999;
    if (orderA !== orderB) {
      return orderA - orderB;
    }
    return a.data.title.localeCompare(b.data.title);
  });
}

/**
 * Retrieves a single project by its slug.
 */
export async function getProjectBySlug(slug: string): Promise<ProjectEntry | undefined> {
  const projects = await getCollection('projects');
  return projects.find((project) => project.data.slug === slug || project.slug === slug);
}

/**
 * Retrieves only featured projects sorted by order.
 */
export async function getFeaturedProjects(): Promise<ProjectEntry[]> {
  const all = await getAllProjects();
  return all.filter((project) => project.data.featured);
}
