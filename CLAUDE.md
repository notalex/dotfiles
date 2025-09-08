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
- No trailing spaces on blank lines
- No blank line before the final closing brace
- Clean, consistent spacing throughout
