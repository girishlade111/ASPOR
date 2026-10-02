<?xml version="1.0" encoding="UTF-8"?>
<!--
  sitemap.xsl — human-readable rendering for the auto-generated sitemap.
  Referenced via the `xslURL` option of @astrojs/sitemap (see astro.config.mjs).
  Handles both <sitemapindex> (sitemap-index.xml) and <urlset> (sitemap-*.xml).
  Crawlers ignore this entirely; it only affects direct browser views.
-->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
  exclude-result-prefixes="sitemap">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>
          <xsl:choose>
            <xsl:when test="sitemap:sitemapindex">Sitemap Index — Girish Lade</xsl:when>
            <xsl:otherwise>Sitemap — Girish Lade</xsl:otherwise>
          </xsl:choose>
        </title>
        <style>
          :root {
            --bg: #08090b;
            --surface: #0d0f14;
            --amber: #e5a93c;
            --teal: #2dd4bf;
            --text: #f8fafc;
            --muted: #94a3b8;
            --border: rgba(255, 255, 255, 0.08);
          }
          * { box-sizing: border-box; }
          body {
            margin: 0;
            background: var(--bg);
            color: var(--text);
            font-family: ui-monospace, 'JetBrains Mono', Menlo, Consolas, monospace;
            min-height: 100vh;
          }
          .wrap { max-width: 960px; margin: 0 auto; padding: 3rem 1.5rem 4rem; }
          .kicker {
            display: inline-flex; align-items: center; gap: 0.5rem;
            font-size: 0.7rem; letter-spacing: 0.2em; text-transform: uppercase;
            color: var(--amber);
            border: 1px solid rgba(229, 169, 60, 0.35);
            background: rgba(229, 169, 60, 0.08);
            border-radius: 9999px; padding: 0.35rem 0.9rem; margin-bottom: 1.25rem;
          }
          .kicker .dot { width: 8px; height: 8px; border-radius: 9999px; background: var(--amber); }
          h1 { font-size: 1.75rem; letter-spacing: -0.01em; margin: 0 0 0.5rem; text-transform: uppercase; }
          h1 .accent { color: var(--amber); }
          p.sub { color: var(--muted); font-size: 0.85rem; margin: 0 0 2rem; }
          p.sub code { color: var(--teal); }
          table { width: 100%; border-collapse: collapse; background: var(--surface);
                  border: 1px solid var(--border); border-radius: 0.75rem; overflow: hidden; }
          thead th {
            text-align: left; font-size: 0.68rem; letter-spacing: 0.18em; text-transform: uppercase;
            color: var(--muted); padding: 0.8rem 1.1rem; border-bottom: 1px solid var(--border);
            background: rgba(255, 255, 255, 0.02); white-space: nowrap;
          }
          tbody td { padding: 0.8rem 1.1rem; border-bottom: 1px solid var(--border);
                     font-size: 0.82rem; vertical-align: top; }
          tbody tr:last-child td { border-bottom: none; }
          tbody tr:hover td { background: rgba(229, 169, 60, 0.04); }
          td.url a { color: var(--text); text-decoration: none; word-break: break-all; }
          td.url a:hover { color: var(--amber); text-decoration: underline; }
          td.date { color: var(--teal); white-space: nowrap; }
          .count { color: var(--muted); font-size: 0.75rem; margin-top: 1.25rem; letter-spacing: 0.08em; }
          .count strong { color: var(--amber); }
        </style>
      </head>
      <body>
        <div class="wrap">
          <span class="kicker"><span class="dot"></span>XML Sitemap</span>
          <xsl:choose>
            <xsl:when test="sitemap:sitemapindex">
              <h1>Sitemap <span class="accent">Index.</span></h1>
              <p class="sub">Generated sitemap chunks for this site. Crawlers follow these automatically; humans can browse them below.</p>
              <table>
                <thead><tr><th>#</th><th>Sitemap</th><th>Last modified</th></tr></thead>
                <tbody>
                  <xsl:for-each select="sitemap:sitemapindex/sitemap:sitemap">
                    <tr>
                      <td><xsl:value-of select="position()"/></td>
                      <td class="url"><a href="{sitemap:loc}"><xsl:value-of select="sitemap:loc"/></a></td>
                      <td class="date"><xsl:value-of select="sitemap:lastmod"/></td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
              <p class="count">TOTAL SITEMAPS: <strong><xsl:value-of select="count(sitemap:sitemapindex/sitemap:sitemap)"/></strong></p>
            </xsl:when>
            <xsl:otherwise>
              <h1>Site <span class="accent">Map.</span></h1>
              <p class="sub">All crawlable pages. Served as <code>application/xml</code> for crawlers — this styled table is only what browsers render via <code>sitemap.xsl</code>.</p>
              <table>
                <thead><tr><th>#</th><th>URL</th><th>Last modified</th></tr></thead>
                <tbody>
                  <xsl:for-each select="sitemap:urlset/sitemap:url">
                    <tr>
                      <td><xsl:value-of select="position()"/></td>
                      <td class="url"><a href="{sitemap:loc}"><xsl:value-of select="sitemap:loc"/></a></td>
                      <td class="date"><xsl:value-of select="sitemap:lastmod"/></td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
              <p class="count">TOTAL URLS: <strong><xsl:value-of select="count(sitemap:urlset/sitemap:url)"/></strong></p>
            </xsl:otherwise>
          </xsl:choose>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
