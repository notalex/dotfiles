## Workspace Configuration

### Excluded Directories
- projects/**
- .git/**
- tmp/**
- log/**
- public/**
- node_modules/**
- coverage/**
- cassettes/**
- .venv/**
- app/assets/**
- Downloads/**
- Documents/**
- gitbasket/**
- Pictures/**
- dist/**

### Access Policy
Claude should not access or modify files in the excluded directories above.

### Claude CLI Configuration
- show_tokens: true

### Code Formatting Rules
When creating or editing files, always enforce these formatting standards:
- **ALWAYS** end files with a single blank line (final newline)
- **NEVER** remove final newlines when editing existing files
- No trailing whitespace at the end of any lines
- No double empty lines (max 1 consecutive blank line)
- No trailing spaces on blank lines
- No blank line before the final closing brace
- Clean, consistent spacing throughout

### File Editing Standards
- When using Edit/Write tools, preserve final newlines
- When adding content, ensure final newline exists
- Remove any trailing whitespace from edited content
- Collapse multiple consecutive blank lines into single blank lines
