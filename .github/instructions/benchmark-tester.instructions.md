---
applyTo: "**"
---

# Benchmark Tester Skill

You have access to a benchmark testing skill for evaluating TypeSpec authoring agents.

## When to use

Use this skill when the user asks to:
- Run benchmark tests
- Test all benchmark cases
- Generate a benchmark test report
- Evaluate the TypeSpec authoring skill

## How to use

Follow the workflow defined in `.github/skills/benchmark-test-local/SKILL.md`:

1. **Discover cases** — scan `cases/` for all `case.md` files, extract prompts and expected answers
2. **Test each case** — feed each case's prompt to the agent and record:
   - Whether the `azure-typespec-author` skill was triggered
   - Whether the `azsdk_typespec_generate_authoring_plan` MCP tool was called
   - Whether the result matches the expected answer (`yes`, `partial`, or `no`)
   - For cases 001005–001008: the agent-user interaction Q&A exchanges
3. **Generate report** — output `benchmark-report.md` in the repo root using the exact format from SKILL.md, and add a row to the README.md report table

## What the skill evaluates

| # | Dimension | What it checks |
|---|-----------|---------------|
| 1 | **Skill Triggered** | Was the `azure-typespec-author` skill invoked? |
| 2 | **MCP Tool Triggered** | Was `azsdk_typespec_generate_authoring_plan` called? (N/A for cases 001005–001008) |
| 3 | **Output Correctness** | Does the response match expected patterns from case.md? |
| 4 | **User Interaction** | Did agent ask clarifying questions? (cases 001005–001008 only) |

## The 23 benchmark cases

5 categories:

- **Versioning** (8 cases): 001001–001004 (general), 001005–001008 (API versioning, interactive)
- **ARMTemplate** (8 cases): 002001–002008
- **LongRunningOperation** (3 cases): 003001–003003
- **Decorators** (3 cases): 004001–004003
- **Warning** (1 case): 005001
