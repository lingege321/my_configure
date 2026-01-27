# P4 Command Reference

## File Operations

| Command | Description |
|---------|-------------|
| `p4 add` | Open new file for add |
| `p4 edit` | Open existing file for edit |
| `p4 delete` | Open file for delete |
| `p4 move` | Move/rename file |
| `p4 copy` | Copy file without branching |
| `p4 revert` | Discard changes |
| `p4 lock` | Lock file to prevent others' submits |
| `p4 unlock` | Release locked file |

## Sync and Update

| Command | Description |
|---------|-------------|
| `p4 sync` | Update workspace to depot |
| `p4 sync -f` | Force sync, overwrite local |
| `p4 sync -k` | Update have list only (no files) |
| `p4 sync -n` | Preview sync |
| `p4 sync -p` | Populate (sync without have list) |
| `p4 flush` | Alias for `sync -k` |
| `p4 reconcile` | Find local changes not in P4 |
| `p4 status` | Show local changes vs depot |

## Changelist Operations

| Command | Description |
|---------|-------------|
| `p4 change` | Create/edit changelist |
| `p4 changes` | List changelists |
| `p4 describe` | Show changelist details |
| `p4 submit` | Submit changelist |
| `p4 reopen` | Move files between changelists |
| `p4 shelve` | Store files on server temporarily |
| `p4 unshelve` | Restore shelved files |

## Diff and History

| Command | Description |
|---------|-------------|
| `p4 diff` | Diff local vs depot |
| `p4 diff2` | Diff two depot files |
| `p4 filelog` | Show file history |
| `p4 annotate` | Show line-by-line history |
| `p4 changes -m N` | Recent N changelists |
| `p4 print` | Print depot file content |

## Branching and Integration

| Command | Description |
|---------|-------------|
| `p4 integrate` | Branch/merge files |
| `p4 merge` | Modern merge (recommended) |
| `p4 copy` | Copy without integration history |
| `p4 resolve` | Resolve conflicts |
| `p4 resolved` | Show resolved files |
| `p4 interchanges` | Show unmerged changes |

## Workspace Management

| Command | Description |
|---------|-------------|
| `p4 client` | Edit workspace spec |
| `p4 client -o` | View workspace spec |
| `p4 clients` | List workspaces |
| `p4 where` | Show file mapping |
| `p4 have` | Show synced files |
| `p4 opened` | Show opened files |

## Information Commands

| Command | Description |
|---------|-------------|
| `p4 info` | Server/client info |
| `p4 set` | Show/set P4 variables |
| `p4 files` | List depot files |
| `p4 dirs` | List depot directories |
| `p4 fstat` | Detailed file info |
| `p4 sizes` | File sizes |

## User and Authentication

| Command | Description |
|---------|-------------|
| `p4 login` | Authenticate |
| `p4 logout` | End session |
| `p4 passwd` | Change password |
| `p4 user` | Edit user spec |
| `p4 users` | List users |
| `p4 tickets` | Show login tickets |

## Common Options

| Option | Description |
|--------|-------------|
| `-c CL` | Specify changelist |
| `-n` | Preview/dry run |
| `-f` | Force operation |
| `-v` | Verbose output |
| `-G` | Python marshalled output |
| `-ztag` | Tagged output format |

## Environment Variables

| Variable | Description |
|----------|-------------|
| `P4PORT` | Server address (host:port) |
| `P4USER` | Username |
| `P4CLIENT` | Workspace name |
| `P4PASSWD` | Password (avoid, use `p4 login`) |
| `P4CONFIG` | Config file name |
| `P4IGNORE` | Ignore file name |
| `P4DIFF` | External diff program |
| `P4EDITOR` | Editor for specs |
