---
name: rr
description: Reread files from disk without changing edits. Trigger on `rr` (git diff files) or `rr path(s)` (explicit files).
---

# RR

Reread files so context matches the latest on-disk content without changing user edits.

## Parse the request

- If the user message is exactly `rr`, run `git diff --name-only` and use only that file list.
- If the user message starts with `rr `, treat the remaining tokens as explicit file paths and use those files only.
- If explicit paths are given, do not auto-add files from `git diff`.

## Execute the reread

1. Resolve the target file list from the parsed request.
2. Skip files that do not exist and report them as skipped.
3. Open and reread each existing target file from disk to refresh context.
4. Preserve all user edits. Never modify, stage, reset, or revert files.
5. Report the files that were reread.

## Guardrails

- For bare `rr`, if `git diff --name-only` is empty, report that no files are available to reread.
- Keep the operation read-only.
