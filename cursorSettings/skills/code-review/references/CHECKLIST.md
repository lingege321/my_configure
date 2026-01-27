# Code Review Detailed Checklist

This file contains the comprehensive checklist for reviewing Zebu C++ code. Use this as a reference when performing detailed code reviews.

## Correctness

- [ ] Logic handles all cases, edge cases (null, empty, boundary)
- [ ] Loop conditions/termination correct, no overflow/underflow
- [ ] Pointer/iterator validity maintained
- [ ] Return values checked, `ZASSERT` for runtime invariants

## Memory Safety

- [ ] RAII + smart pointers (`unique_ptr`, `shared_ptr`), no naked new/delete
- [ ] Raw pointers only for non-owning references
- [ ] No dangling pointers or use-after-free
- [ ] Bounds checking for array/vector access

## Naming Conventions 🔴 CRITICAL

**Refer to code-standards skill for detailed naming conventions. Key points:**

- [ ] **Classes**: Use namespace (`ZDO::Port`), avoid prefixes (`zdoPort_C`)
- [ ] **Private members**: `_` prefix, no Hungarian notation (`_id`, not `m_nId`)
- [ ] **Public members**: NO prefix (`id`, not `_id`)
- [ ] **Enums**: Prefer `enum class` over traditional `_E` suffix
- [ ] **Functions**: Getters marked `[[nodiscard]]` and `const`
- [ ] **Legacy code**: Accept `m_` prefix in existing files, flag in new code

## Interface

**API:**
- [ ] Minimal, focused interface (no god classes)
- [ ] Clear single responsibilities
- [ ] Return by value or const reference (not non-const ref)

**Const Correctness:**
- [ ] Non-modifying methods marked `const`
- [ ] Parameters: `const&` when not modified
- [ ] `const auto&` in range loops

**Encapsulation:**
- [ ] Private members with `_` prefix
- [ ] No public member variables (except POD structs)
- [ ] Forward declarations minimize dependencies

**Modern C++:**
- [ ] `[[nodiscard]]` on getters and factories
- [ ] `auto` for type deduction
- [ ] Structured bindings for tuple/pair
- [ ] Range-based for > index-based
- [ ] `std::ranges` > hand-written loops

## Rule of Zero (Preferred) / Rule of Five

- [ ] **Best: Rule of Zero** - Use RAII types, no custom special members needed
  ```cpp
  class DataModel {
  private:
      std::unique_ptr<Graph> _graph;        // Automatic cleanup
      std::vector<Port*> _ports;            // Automatic cleanup
      std::string _name;                    // Automatic cleanup
      // Compiler-generated destructor/copy/move are correct!
  };
  ```
- [ ] **If needed: Rule of Five** - Explicitly handle all or delete all
  ```cpp
  // Non-copyable, non-movable (common pattern)
  Port(const Port&) = delete;
  Port& operator=(const Port&) = delete;
  Port(Port&&) = delete;
  Port& operator=(Port&&) = delete;
  ```

## PIMPL Pattern

- [ ] `std::unique_ptr<Impl> _impl` for encapsulation
  ```cpp
  class MyClass {
  private:
      class Impl;
      std::unique_ptr<Impl> _impl;
  };
  ```

## Namespaces

- [ ] Common Zebu namespaces: `ZDO`, `ZFPGA`, `ZNET`, `ZMN` (monitoring)
- [ ] Sub-namespaces: `ZDO::FLOW`, `ZDO::RDP`, `ZFPGA::TIMING`, etc.
- [ ] Nested namespace syntax: `namespace MODULE::SUBMODULE { }`

## Code Patterns

**Early Exit (MANDATORY):**
- [ ] Early return/continue vs nested conditionals
  ```cpp
  // GOOD
  if (ports.empty() || !isValid) {
      continue;
  }
  processValid(ports);

  // BAD
  if (!ports.empty() && isValid) {
      processValid(ports);
  }
  ```

**Merge Related Conditions:**
- [ ] Combined checks in single if
  ```cpp
  if (v->getFlag(eFix) || v->getFlag(eDefpart) || !v->isValid()) {
      continue;
  }
  ```

**Extract Helpers:**
- [ ] Complex logic → static helpers
- [ ] Functions < 50 lines

**Formatting 🔴 CRITICAL:**
- [ ] NO trailing spaces
- [ ] Consistent indentation
- [ ] No trailing whitespace in blank lines

## Error Handling

**Assertions:**
- [ ] `ZASSERT` for runtime invariants
- [ ] `static_assert` for compile-time checks

**Logging:**
- [ ] `STEPNAME` constant at file top (common Zebu pattern)
  ```cpp
  constexpr const char* STEPNAME = "MODULE_NAME";
  ```
- [ ] Common logger: `zlog` with levels: `echo` (user), `trace` (debug), `warning`, `fatalError`
- [ ] Module-specific loggers may exist (e.g., `fpgaLog`, `netgenLog`)
- [ ] Format strings match argument types

**Timing:**
- [ ] `ZMN::ScopedTimer` for significant operations

## Performance

**Avoid Copies:**
- [ ] Large objects: pass by `const&`
- [ ] Use `std::move` for ownership transfer
- [ ] Reserve vector capacity when size known

**Algorithm Efficiency:**
- [ ] Appropriate data structures (unordered_map vs map)
- [ ] O(n) or better for hot paths
- [ ] Use `std::ranges` views to avoid intermediate copies

## File Structure

**Headers:**
- [ ] `#pragma once` (not guards)
- [ ] Includes ordered: std → boost → 3rd-party → internal
- [ ] Forward declarations minimize dependencies

**Implementation:**
- [ ] Anonymous namespace for file-local helpers
- [ ] Static helpers for complex logic

## Common Issues

### Critical Violations
- Hungarian notation in new code (`m_nId`, `m_pVertex`) → Use modern naming
- Missing `_` prefix on private members → Add underscore prefix
- Incorrect `_` prefix on public members → Remove underscore prefix
- Module prefixes instead of namespaces → Use `Namespace::Class`

### Interface Issues
- Non-const ref returns → Return `const&`
- Missing `[[nodiscard]]` on getters → Add attribute
- Collection setters → Use add/remove methods
- Missing const correctness → Mark methods/params const

### Code Smells
- Manual memory management → Use RAII
- Naked new/delete → Use smart pointers
- Deep nesting → Extract functions, early returns
- Missing const → Mark read-only
- C-style casts → Use C++ casts
- Trailing spaces → 🔴 Remove all
