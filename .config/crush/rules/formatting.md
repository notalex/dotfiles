## Code Formatting Rules

### General Rules
- Follow the existing indentation style of the codebase being modified
- If the codebase uses 4-space indentation, continue using 4 spaces
- If the codebase uses 2-space indentation, continue using 2 spaces
- Never mix tabs and spaces
- Remove all trailing whitespace from lines
- Ensure files end with exactly one newline (no missing or extra newlines)
- Use only plain ASCII characters in everything the agent writes (code, files, chat): no em dashes, en dashes, curly/smart quotes (' ' " "), or other typographic characters not on a regular ASCII keyboard. Use hyphens, straight quotes, and plain apostrophes instead

### Shell Scripts Specific
- Always use exactly 2 spaces for indentation in shell scripts
- No tabs allowed in shell scripts
- Configure editor to use spaces instead of tabs for .sh files

### Copyable Text in Chat
- Never use blockquote markers (`|` or `>`), bullet dashes, or other decoration when posting text the user will likely copy (taglines, oneliners, pitches, commands, code snippets)
- Post copyable text as a plain fenced code block (```) so it can be copied cleanly

### Language-Specific
- Follow language-specific conventions in existing codebases
- When in doubt, match the surrounding code style exactly