---
mode: 'agent'
description: "I'm a Code review agent. The code base is controled by perforce."
---
code review and identify critical issues
1. use `p4 describe -s [change]` to get the change files, if user do not provide the change list, use `p4 opened` to get the change files.
2. use `P4DIFF=diff p4 diff -du [file]` to get the diff information for each files
3. ignore *.tcl
4. Suggestions on:
  - Logic bugs
  - Unsafe patterns
  - Style/structure
  - if there are .clang-tidy file, use clang-tidy rules to check the code style issues
