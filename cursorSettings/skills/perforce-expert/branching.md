# Branching and Integration

## Branch Strategies

### Create a Branch
```bash
# Using integrate (traditional)
p4 integrate //depot/main/... //depot/branch/...
p4 submit -d "Branch from main"

# Using copy (no merge history)
p4 copy //depot/main/... //depot/branch/...
p4 submit -d "Copy from main"
```

### Merge Changes

```bash
# Merge from main to branch
p4 merge //depot/main/... //depot/branch/...
p4 resolve -am          # Auto-merge safe changes
p4 resolve              # Handle remaining conflicts
p4 submit -d "Merge from main"

# Reverse integrate (branch to main)
p4 merge //depot/branch/... //depot/main/...
p4 resolve -am
p4 submit -d "Integrate branch to main"
```

## Integration Commands

### p4 integrate vs p4 merge
- `p4 merge` - Modern, recommended. Cleaner conflict detection.
- `p4 integrate` - Traditional. More options, complex behavior.

### Check Integration Status
```bash
# What needs to be merged?
p4 interchanges //depot/main/... //depot/branch/...

# Integration history
p4 integrated //depot/branch/...

# Preview integration
p4 integrate -n //depot/main/... //depot/branch/...
```

## Resolve Strategies

| Command | Behavior |
|---------|----------|
| `p4 resolve` | Interactive mode |
| `p4 resolve -am` | Auto-merge (safe only) |
| `p4 resolve -as` | Accept safe (no conflicts) |
| `p4 resolve -at` | Accept theirs (source wins) |
| `p4 resolve -ay` | Accept yours (target wins) |
| `p4 resolve -af` | Force accept (dangerous) |

### Resolve Workflow
```bash
# 1. Preview conflicts
p4 resolve -n

# 2. Auto-merge what's safe
p4 resolve -am

# 3. Handle remaining manually
p4 resolve

# 4. Verify all resolved
p4 resolved
```

## Branch Specs

### Create Branch Spec
```bash
p4 branch my-branch-spec
```

Branch spec content:
```
Branch: my-branch-spec
Owner:  username
Description: Main to feature branch mapping

View:
    //depot/main/... //depot/feature/...
```

### Use Branch Spec
```bash
# Integrate using spec
p4 integrate -b my-branch-spec

# Reverse direction
p4 integrate -b my-branch-spec -r
```

## Stream Depots (Modern Branching)

### Stream Hierarchy
```
mainline (type: mainline)
└── release (type: release, parent: mainline)
└── development (type: development, parent: mainline)
    └── feature (type: task, parent: development)
```

### Stream Commands
```bash
# Create stream
p4 stream //depot/main

# Switch streams
p4 switch //depot/feature

# Merge down, copy up
p4 merge --from parent
p4 copy --to parent
```

## Common Branching Issues

### "All revisions already integrated"
Files already merged. Check with:
```bash
p4 interchanges //source/... //target/...
```

### "Can't integrate without -d flag"
Target has pending changes. Either:
```bash
p4 submit                    # Submit first
# OR
p4 integrate -d ...          # Allow with pending
```

### "Must sync before integrate"
```bash
p4 sync //target/...
p4 integrate //source/... //target/...
```
