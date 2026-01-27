# Perforce Administration

## Permissions (Protections)

### View Current Protections
```bash
p4 protects                  # Your effective permissions
p4 protects -u username      # User's permissions
p4 protects -g groupname     # Group's permissions
p4 protect                   # Edit protection table (admin)
```

### Protection Levels
| Level | Abilities |
|-------|-----------|
| `list` | See file/directory names |
| `read` | Sync files |
| `open` | Open for add/edit/delete |
| `write` | Submit changes |
| `admin` | Admin commands on paths |
| `super` | Full server access |
| `review` | Access `p4 review` |

### Protection Table Format
```
<permission> <type> <name> <host> <path>
```
Example:
```
write user alice * //depot/project/...
read group devs * //depot/...
super user admin * //...
```

## Groups

```bash
p4 group mygroup             # Create/edit group
p4 groups                    # List all groups
p4 groups username           # User's groups
```

Group spec:
```
Group: developers
MaxResults: unlimited
MaxScanRows: unlimited
MaxLockTime: unlimited
Timeout: 43200
PasswordTimeout: unlimited
Subgroups:
Owners: admin
Users:
    alice
    bob
```

## Triggers

### View/Edit Triggers
```bash
p4 triggers                  # Edit trigger table
```

### Trigger Types
| Type | When it runs |
|------|--------------|
| `change-submit` | Before changelist commits |
| `change-commit` | After changelist commits |
| `change-content` | After file transfer, before commit |
| `form-in` | Form input (pre-processing) |
| `form-out` | Form output (post-processing) |
| `form-save` | Form save |

### Example Triggers
```
Triggers:
    check-format change-submit //depot/... "/path/to/script.sh %changelist%"
    notify change-commit //depot/... "/path/to/notify.sh %changelist%"
```

## Server Maintenance

### Check Server Status
```bash
p4 monitor show              # Active commands
p4 lockstat                  # Lock status
p4 dbstat -a                 # Database stats
```

### Verify Database
```bash
p4 verify //depot/...        # Verify archive integrity
p4 verify -q //depot/...     # Quiet mode (errors only)
```

### Obliterate Files (Destructive)
```bash
p4 obliterate -y //depot/path/...   # Permanently remove
# WARNING: Use -y only after preview without it
```

### Journals and Checkpoints
```bash
p4 admin checkpoint          # Create checkpoint
p4 admin journal             # Rotate journal
```

## Labels

```bash
p4 label mylabel             # Create/edit label
p4 labels                    # List labels
p4 labelsync -l mylabel      # Apply label to workspace
p4 tag -l mylabel //depot/...       # Tag files
```

## Jobs and Fixes

```bash
p4 job                       # Create job
p4 jobs                      # List jobs
p4 fix -c CL jobname         # Link job to changelist
p4 fixes -j jobname          # Show fixes for job
```

## Useful Admin Queries

### Find Large Files
```bash
p4 sizes -sh //depot/...
```

### Find User Activity
```bash
p4 changes -u username -m 50
p4 opened -u username -a
```

### Find Files by Extension
```bash
p4 files //depot/....exe
p4 files //depot/....dll
```

### Server Configuration
```bash
p4 configure show            # Show all configurables
p4 configure set name=value  # Set configurable
```

## Common Admin Issues

### "You don't have permission"
Check protections:
```bash
p4 protects //path/to/file
```

### "Maximum results exceeded"
Increase limit or use `-m`:
```bash
p4 files -m 10000 //depot/...
# Or admin: increase MaxResults in group
```

### "Database locked"
Check what's running:
```bash
p4 monitor show
p4 monitor terminate <id>    # Kill process (carefully)
```
