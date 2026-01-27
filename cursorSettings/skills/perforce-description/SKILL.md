---
name: perforce-description
description: Generate Perforce changelist descriptions by analyzing code diffs. Use when the user asks to create a p4 description, write a changelist description, prepare a p4 submission, or needs help describing code changes for Perforce.
---

# Perforce Description Generator

Generate concise and informative changelist descriptions by analyzing code changes.

## Workflow

### Step 1: Gather Change Information

Run these commands to understand the changes:

```bash
# Get opened files
p4 opened

# Get diff for changes in current workspace
P4DIFF=diff p4 diff

# Get client info for template
p4 client -o
```

If `compile_commands.json` exists in the workspace, use it to understand the code context.

### Step 2: Generate Description

Create a changelist specification using this template:

```
Change: new

Client: <ClientName from p4 client -o>

User: <Owner from p4 client -o>

Status: new

Description:
	<description here>
```

## Description Guidelines

### Format Rules
- Use **tab** (not spaces) for indentation
- Max **80 characters** per line
- Use **Markdown** format within the description

### Content Rules
1. **Be concise**: 2-3 sentence summary capturing the essence of the change
2. **Be informative**: Highlight key aspects:
   - What was changed (features, bug fixes, refactoring)
   - Why the change was made (performance, bug fix, etc.)
   - Important context or implications
3. **Per-file summary**: Brief description (max 1 sentence) for each changed file
4. **No public code**: Don't include actual code in the description
