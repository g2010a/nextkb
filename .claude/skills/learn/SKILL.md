---
name: learn
description: reads a document and stores learning in the knowledgebase
---

## What I do

- Read the source document
- Discuss key takeaways with the user before writing anything
- Create a summary page in 3-aikb with a sanitized file name based on the source
- Create or update concept pages for each major idea or entity
- Add wiki-links [[like this]] to connect related pages
- Update `3-aikb/index.md` with new pages and one-line descriptions
- Append an entry to `./log.md` (outside `3-aikb`) with the date, source name, and what changed
- Move the source file from `1-raw` to `2-processed` (!`mv "${RAW_LOCATION}" "${PROCESSED_LOCATION}"`)

A single source may touch many wiki pages, that is normal.

### Page format

```markdown
# Page title

**Summary**: One or two sentences describing this page.

**Sources**
- List of raw source files this page draws from

**Last updated**: Date of most recent update

---

Main content goes here. Use clear headings and short paragraphs.

Link to related concepts using [[wiki-links]] throughout the text.

## Related pages

- [[related-concept-1]]
- [[related-concept-3]]
```

### Citation rules

* Every factual claim should reference its source file
* Use the format (source: filename.ext) after the claim
* If two sources disagree, note the contradiction explicitly
* If a claim has no source, mark it as needing verification

### Answering questions

When the user asks a question:

1. Run a qmd query to fetch relevant starting points. Alternatively, read
   `3-aikdb/index.md` to find relevant pages
2. Read the results / pages and synthesize an answer
3. Cite specific wiki pages in your response
4. If the answer is not in the wiki, say so clearly
5. If the answer is valuable, offer to save it as a new wiki page

## When to use me

Use this skill when extracting information from a file from `1-raw/` into the knowledge base.
