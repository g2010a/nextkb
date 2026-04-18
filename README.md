# AI Knowledge Base (NextKB)

A **local**, LLM-managed knowledgebase that uses qmd for indexing, embedding, and querying markdown documents. Built as a metaharness that piggy-backs on opencode (an AI coding assistant) to provide commands, skills, and agent definitions for maintaining an AI-curated wiki.

Primarily, however, this is a personal exploration of metaharnesses. You're probably better served by https://openwebui.com/

## Get started right away

Put some documents (text, markdown, maybe PDF?) in `1-raw/`, then do this in the shell:

```bash
devbox update  # just in case, to avoid conflicts with your local database
devbox shell
# Inside the shell
opencode
```

## Job to Be Done

As a knowledge worker, researcher, or builder who wants to maintain a personal body of knowledge on my device, that grows over time and remains queryable, I want an AI agent to help me capture, organize, and retrieve information from diverse sources so that I can build a coherent mental model of topics I care about without manually maintaining index cards or forgetting what I've read.

**Resources that could help**: An AI assistant that can read documents, extract key concepts, create interlinked summaries, and search that knowledge base on demand.

**Constraints that keep me from achieving this**: I don't have time to manually index everything I read. I forget connections between ideas. Without a system, my notes become orphaned files I never revisit. I lack the discipline to maintain a personal wiki manually.

**Functional aspects**: Process incoming documents (articles, papers, bookmarks) into searchable, linked wiki pages. Enable natural language queries that return relevant context rather than just keywords. Keep the knowledge base organized without manual maintenance.

**Social and emotional factors**: I want to feel like I'm building something cumulative rather than reinventing the wheel each time. I want to be perceived as someone with deep, interconnected knowledge rather than someone who skims surface-level content. I want the satisfaction of having an AI "colleague" that knows what I've read and can remind me of relevant ideas.

## Solution

The system uses:
- **opencode** as the AI agent interface
- **qmd** (Query Markdown Documents) as a local MCP server for semantic search
- **Skills** (`learn`, `process-raw`) that define agent behavior
- **Folder structure**: `1-raw/` → `2-processed/` → `3-aikb/`

Documents flow through the pipeline: raw sources are processed by the LLM into wiki pages, which are then indexed for semantic querying.

## Dependencies

Managed by **devbox** (https://www.jetify.com/devbox):
- **opencode** - AI coding assistant
- **qmd** - Local MCP server for markdown querying
- **bun** - JavaScript runtime

No manual installation required—just run `devbox shell`.

## Instructions

### Setup

Devbox manages all dependencies (bun, opencode, qmd). Initialize the shell:

```bash
devbox shell
devbox run install
```

### Adding New Documents

1. Place source documents in `1-raw/`
2. Run opencode on this directory:
   ```bash
   opencode
   ```
3. Ask: "process raw files"
4. The system will:
   - Read each file via the `learn` skill
   - Create summary pages in `3-aikb/`
   - Link related concepts with `[[wiki-links]]`
   - Update `3-aikb/index.md`
   - Move processed files to `2-processed/`
   - Refresh the qmd index

### Querying the Knowledge Base

Ask opencode any question about the knowledgebase:
- "What do we know about AI technical debt?"
- "Find pages related to prompt injection"

The LLM will query qmd, read relevant pages, and synthesize an answer with citations.

### Manual qmd Commands

```bash
qmd collection list    # List collections
qmd update             # Update collection from files
qmd embed              # Rebuild embeddings
qmd query "your question"  # Query the collection
```

## Folder Structure

```
1-raw/          # Source documents to be processed
2-processed/    # Processed source files (immutable)
3-aikb/         # AI-maintained markdown wiki pages
  index.md      # Master index with all pages
```
