# Multi-Agent Configuration for Zebu Project

## Agent Roles and Responsibilities

This file defines the multi-agent strategy for the Zebu project, establishing clear domain boundaries and agent responsibilities.

---

## 🎯 Agent 1: Core Architecture Agent

**Domain:** Core system architecture and graph structures
**Focus Areas:**
- `sw_cc/ktim/ktim_tgraph.*` - Timing graph structures
- Core data structures and algorithms
- Memory management and optimization

**Responsibilities:**
- Design and implement graph algorithms
- Optimize data structures for performance
- Handle complex timing analysis logic
- Maintain architectural consistency

**Rules:**
- Must maintain backward compatibility
- Document all API changes
- Run performance benchmarks before committing

---

## 🔧 Agent 2: Interface & API Agent

**Domain:** Public interfaces and API design
**Focus Areas:**
- Header files (*.hh, *.h)
- Public API definitions
- Interface contracts

**Responsibilities:**
- Design clean, intuitive APIs
- Document all public interfaces
- Ensure API consistency across modules
- Handle deprecation properly

**Rules:**
- All public methods must have documentation
- API changes require review from Agent 1
- Must maintain interface stability

---

## 🧪 Agent 3: Testing & Validation Agent

**Domain:** Test suites and validation
**Focus Areas:**
- Test files and test frameworks
- Validation scripts
- Debugging utilities

**Responsibilities:**
- Create comprehensive test cases
- Perform code validation
- Set up CI/CD pipelines
- Debug failing tests

**Rules:**
- Minimum 80% code coverage
- Test both normal and edge cases
- Document test scenarios

---

## 📊 Agent 4: Performance & Optimization Agent

**Domain:** Performance optimization and profiling
**Focus Areas:**
- Algorithm optimization
- Memory management
- Profiling and benchmarking

**Responsibilities:**
- Identify performance bottlenecks
- Optimize critical paths
- Reduce memory footprint
- Profile and benchmark code

**Rules:**
- Must provide before/after metrics
- Document optimization strategies
- Preserve correctness while optimizing

---

## 📝 Agent 5: Documentation Agent

**Domain:** Code documentation and knowledge base
**Focus Areas:**
- README files
- Code comments
- API documentation
- Design documents

**Responsibilities:**
- Maintain up-to-date documentation
- Create usage examples
- Document design decisions
- Generate API reference docs

**Rules:**
- Use clear, concise language
- Provide practical examples
- Keep documentation synchronized with code

---

## 🔒 Agent 6: Security & Validation Agent

**Domain:** Code security and input validation
**Focus Areas:**
- Input validation
- Boundary checks
- Error handling
- Security vulnerabilities

**Responsibilities:**
- Review code for security issues
- Implement robust error handling
- Validate all inputs
- Check for buffer overflows and memory leaks

**Rules:**
- Assume all inputs are malicious
- Implement defense in depth
- Document security considerations

---

## Domain Boundaries

### Core Implementation Domain
**Owner:** Agent 1, Agent 4
**Files:**
```
sw_cc/ktim/ktim_tgraph.cc
sw_cc/ktim/ktim_tgraph.hh
sw_cc/ktim/*.cc (implementation files)
```

### Interface Domain
**Owner:** Agent 2
**Files:**
```
sw_cc/ktim/*.hh (header files)
include/*.h (public headers)
```

### Testing Domain
**Owner:** Agent 3
**Files:**
```
tests/*
test_*.cc
*_test.cc
```

### Documentation Domain
**Owner:** Agent 5
**Files:**
```
*.md
docs/*
README.*
```

---

## Coordination Rules

### Inter-Agent Communication
1. **Interface Changes:** Agent 2 must consult Agent 1 before API changes
2. **Performance Impact:** Agent 4 must validate changes from Agent 1
3. **Test Coverage:** Agent 3 must validate all changes before merge
4. **Documentation Sync:** Agent 5 updates docs after Agent 2 finalizes APIs

### Conflict Resolution
- If agents have conflicting changes in the same file:
  - Use Git worktrees for isolation
  - Coordinate through checkpoint reviews
  - Senior agent (Agent 1) makes final decision

### Review Checkpoints
- **Pre-commit:** Agent 3 validates tests pass
- **Pre-merge:** Agent 5 ensures documentation is updated
- **Post-merge:** Agent 4 runs performance benchmarks

---

## Parallel Execution Strategy

### Task Parallelization
```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│  Agent 1    │     │  Agent 2    │     │  Agent 3    │
│  Implement  │────▶│  Design API │────▶│  Create     │
│  Algorithm  │     │  Interface  │     │  Tests      │
└─────────────┘     └─────────────┘     └─────────────┘
       │                    │                    │
       ▼                    ▼                    ▼
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│  Agent 4    │     │  Agent 5    │     │  Agent 6    │
│  Optimize   │     │  Document   │     │  Validate   │
│  Code       │     │  Features   │     │  Security   │
└─────────────┘     └─────────────┘     └─────────────┘
```

### Example Workflow
1. **Agent 1** implements core timing graph algorithm
2. **Agent 2** designs public API (parallel with step 1)
3. **Agent 3** creates test cases based on Agent 2's API
4. **Agent 4** profiles and optimizes Agent 1's implementation
5. **Agent 5** documents the feature based on finalized API
6. **Agent 6** validates inputs and error handling

---

## Model Selection

### Agent-Model Mapping
- **Agent 1 (Core):** Claude Sonnet 4.5 or Composer (complex reasoning)
- **Agent 2 (API):** Claude Sonnet 4.5 (design expertise)
- **Agent 3 (Testing):** Composer (fast test generation)
- **Agent 4 (Performance):** Claude Sonnet 4.5 (optimization)
- **Agent 5 (Docs):** GPT-4 or Composer (clear writing)
- **Agent 6 (Security):** Claude Sonnet 4.5 (security expertise)

### Parallel Model Comparison
For critical implementations, run 2-3 agents with different models:
- Compare outputs from Composer, Claude Sonnet 4.5, and GPT-5
- Select the best implementation
- Merge insights from multiple approaches

---

## Usage Example

When working on a new feature:

```plaintext
Task: Implement new timing path analysis algorithm

Step 1: Assign agents to parallel tasks
├─ Agent 1: Implement core algorithm in ktim_tgraph.cc
├─ Agent 2: Design API in ktim_tgraph.hh
├─ Agent 3: Prepare test framework
└─ Agent 5: Draft documentation outline

Step 2: Integration phase
├─ Agent 3: Write tests based on Agent 2's API
├─ Agent 4: Profile Agent 1's implementation
└─ Agent 6: Review for security issues

Step 3: Finalization
├─ Agent 5: Complete documentation
├─ Agent 3: Validate all tests pass
└─ Agent 4: Confirm performance targets met
```

---

## Monitoring and Review

### Agent Activity Dashboard
Track each agent's contributions:
- Lines of code modified
- Number of commits
- Test coverage impact
- Documentation completeness
- Performance improvements

### Quality Gates
All agents must pass:
✅ Code compiles without warnings
✅ All tests pass
✅ Documentation is updated
✅ Performance benchmarks meet targets
✅ Security review completed
✅ Code review approved

---

## Version History
- v1.0 - Initial multi-agent configuration for Zebu project
- Date: November 6, 2025

