---
name: code-review
description: Review C++ code for correctness, security, performance, maintainability, and Zebu codebase conventions. Use when reviewing pull requests, examining code changes, perforce opened files, or when the user asks for a code review of Zebu C++ files (zDieOpt, zNetgen, zFpgaTiming, etc.).
disable-model-invocation: true
---

# Zebu C++ Code Review

This skill guides you through the code review process for Zebu C++ code. It's designed as a command/workflow focused on the review process.

## Review Process 🔴 MANDATORY WORKFLOW

Follow these steps in order:

### Step 1: Load Standards and Rules

**Project-Specific Rules (Highest Priority):**
- Check `.cursorrules` file in project root
- Check `.cursor/rules/` directory for additional rules
- **Project rules override all other guidelines**

**Coding Standards:**
- Read **code-standards** skill for Zebu C++ conventions
- Understand naming rules (classes, members, functions)
- Know interface design patterns

**Detailed Review Checklist (Optional Reference):**
- See `references/CHECKLIST.md` for comprehensive checklist
- Use as needed for thorough reviews

### Step 2: Get Code Changes

**Perforce:**
```bash
p4 opened
export P4DIFF="diff -du"
p4 diff
```
- Use **code-perforce** skill for detailed operations

**Git:**
```bash
git diff
# or for branch comparison
git diff main...HEAD
```

### Step 3: Perform Review

Focus on these areas **in priority order**:

1. **🔴 Correctness** - Logic, edge cases, null checks, invariants
2. **🔴 Memory Safety** - RAII, smart pointers, no leaks, no use-after-free
3. **🟡 Project Rules** - Follow `.cursorrules` and `.cursor/rules/`
4. **🟡 Coding Standards** - Apply **code-standards** (naming, interfaces)
5. **🟡 Performance** - Avoid unnecessary copies, efficient algorithms
6. **🟢 Maintainability** - Modern C++, clear code, good patterns

**Quick Review Checklist:**
- [ ] Logic is correct for all cases (including edge cases)
- [ ] No memory safety issues (use RAII and smart pointers)
- [ ] Follows project rules (if they exist)
- [ ] Naming follows code-standards (check classes, members, functions)
- [ ] Interfaces are clean (const correctness, [[nodiscard]], encapsulation)
- [ ] No trailing spaces 🔴 CRITICAL
- [ ] Code is maintainable (clear intent, good patterns)

### Step 4: Generate Review Output

**🔴 MANDATORY**: Use the standardized output format below. Do not deviate.

## Severity Guidelines

Use these severity levels when categorizing issues:

**🔴 Critical (Must Fix Before Merge):**
- Correctness: Logic errors, null pointer bugs, edge case failures
- Memory Safety: Leaks, use-after-free, dangling pointers
- Naming in new code: Hungarian notation (`m_nId`), missing `_` on private members
- Formatting: Trailing spaces
- Interface: Breaking encapsulation, non-const ref returns

**🟡 Suggestions (Should Consider):**
- Performance: Unnecessary copies, inefficient algorithms
- Code Clarity: Deep nesting, missing early exits
- Modern C++: Missing `[[nodiscard]]`, could use `auto`
- Maintainability: Extract helpers, simplify logic

**🟢 Nice to Have (Optional Enhancements):**
- Additional documentation or comments
- More descriptive variable names
- Additional unit tests
- Minor refactoring opportunities

## Review Output Format 🔴 MANDATORY

**🔴 CRITICAL**: You MUST use this exact format for all code reviews. Do not deviate from this structure.

```markdown
## Code Review Summary

**Overall Assessment**: [High-level summary of code quality and readiness]
**Files Reviewed**: [Count] files

### Critical Issues 🔴
[List blocking issues that MUST be fixed before merge. Include specific line references and file paths.]

- **File: path/to/file.cc, Line X**: [Issue description]
  - **Problem**: [What's wrong]
  - **Why**: [Why it's critical]
  - **Fix**: [How to fix it]

### Suggestions 🟡
[List recommended improvements. Include specific line references and file paths.]

- **File: path/to/file.cc, Line Y**: [Suggestion description]
  - **Issue**: [What could be better]
  - **Benefit**: [Why this matters]
  - **Recommendation**: [Proposed improvement]

### Nice to Have 🟢
[Optional enhancements that would improve code quality]

### Positive Highlights ✅
[Call out good practices, clever solutions, proper patterns used]

### Detailed Comments

#### File: path/to/file.cc

**Line X**: [Specific feedback]
- **Issue**: [What needs attention]
- **Why**: [Reasoning]
- **Fix**: [Solution]
```

**Required Output Elements:**
1. ✅ Overall Assessment with file count
2. ✅ Three severity sections (🔴 Critical, 🟡 Suggestions, 🟢 Nice to Have)
3. ✅ Positive Highlights section (always acknowledge good code)
4. ✅ Detailed Comments with file names and line numbers
5. ✅ Clear Issue/Why/Fix or Problem/Benefit/Recommendation structure

## Related Skills

- **code-standards**: Zebu C++ naming and coding conventions - read this for detailed naming rules
- **code-perforce**: Perforce operations (diffs, opened files, changelists)
- **references/CHECKLIST.md**: Comprehensive review checklist (optional detailed reference)

## Key Principles

**Priority Order:**
1. **Correctness** - Logic must be correct first
2. **Memory Safety** - No leaks, no crashes
3. **Project Rules** - Follow `.cursorrules` and `.cursor/rules/`
4. **Coding Standards** - Apply code-standards skill
5. **Style** - Clean, maintainable code

**Review Philosophy:**
- Focus on changed lines + immediate context
- Be constructive and specific
- Always acknowledge good patterns (Positive Highlights required)
- Zebu is performance-critical (hardware emulation) - consider algorithmic complexity
- Understand domain constraints (timing, partitioning, FPGA resources)
- Modern code over legacy patterns (but accept legacy in existing files)
