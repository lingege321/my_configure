---
name: perforce-expert
description: Perforce/P4 expert for troubleshooting, commands, workflows, branching, and administration. Use when the user has P4 errors, needs help with Perforce commands, sync/submit/resolve issues, branching strategies, merge conflicts, workspace configuration, or any Helix Core version control questions.
---

# Perforce Expert

Comprehensive P4 CLI assistance based on [official documentation](https://help.perforce.com/helix-core/server-apps/cmdref/current/Content/CmdRef/Home-cmdref.html).

## Quick Diagnostics

When troubleshooting, always start by gathering context:

```bash
# Environment and connection
p4 info
p4 set

# Current workspace state
p4 client -o
p4 opened
p4 status

# Check for pending changes
p4 changes -s pending -u $USER
```

## Common Workflows

### Sync and Update
```bash
p4 sync                      # Sync to head
p4 sync @changelist          # Sync to specific changelist
p4 sync -f //depot/path/...  # Force sync (overwrites local)
p4 sync -n                   # Preview sync (dry run)
```

### Edit and Submit
```bash
p4 edit <file>               # Open for edit
p4 add <file>                # Add new file
p4 delete <file>             # Mark for delete
p4 revert <file>             # Discard changes
p4 submit -d "description"   # Submit default changelist
p4 submit -c <CL>            # Submit specific changelist
```

### Resolve Conflicts
```bash
p4 resolve                   # Interactive resolve
p4 resolve -am               # Auto-merge where safe
p4 resolve -at               # Accept theirs
p4 resolve -ay               # Accept yours
p4 resolve -n                # Preview conflicts
```

### Changelists
```bash
p4 change                    # Create new changelist
p4 change -o <CL>            # View changelist
p4 changes -m 10             # Recent changelists
p4 reopen -c <CL> <file>     # Move file to changelist
p4 shelve -c <CL>            # Shelve changes
p4 unshelve -s <CL>          # Unshelve changes
```

## Troubleshooting Guide

### Connection Issues
| Error | Solution |
|-------|----------|
| "Connect to server failed" | Check `P4PORT`: `p4 set P4PORT=server:port` |
| "Perforce password invalid" | Run `p4 login` or check `P4PASSWD` |
| "Client unknown" | Set client: `p4 set P4CLIENT=clientname` |

### Sync Issues
| Error | Solution |
|-------|----------|
| "can't clobber writable file" | Use `p4 sync -f` or `p4 reconcile` |
| "file(s) up-to-date" | File already at head; use `p4 sync -f` to force |
| "no such file" | Check depot path with `p4 files //depot/...` |

### Submit Issues
| Error | Solution |
|-------|----------|
| "must resolve before submit" | Run `p4 resolve` first |
| "out of date" | Run `p4 sync` then `p4 resolve` |
| "no files to submit" | Check `p4 opened` - files may not be checked out |

### Workspace Issues
| Error | Solution |
|-------|----------|
| "not in client view" | Update client spec: `p4 client` |
| "file not on client" | Check workspace mapping matches depot path |

## Additional Resources

- For complete command reference, see [commands.md](commands.md)
- For branching and integration, see [branching.md](branching.md)
- For admin tasks, see [admin.md](admin.md)
