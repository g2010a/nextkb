---
name: process-raw
description: Process raw documents
---

## What I do

- Initialize knowledge base: !`./init.sh`
- Get a list of files in 1-raw: !`ls 1-raw`
- Use a subagent to scan each file asynchronously with the `learn` skill
- After the subagents complete scanning all files and none are left in `1-raw/`,
  refresh the vector database by executing !`qmd update` and !`qmd embed`
