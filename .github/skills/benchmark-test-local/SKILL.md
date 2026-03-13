---
name: benchmark-test-local
description: "Run all TypeSpec authoring benchmark cases locally and generate a standardized report. USE FOR: running benchmark tests, testing all benchmark cases, evaluating the TypeSpec authoring skill, generating benchmark test reports. WHEN: 'run benchmark tests', 'test all cases', 'generate benchmark report', 'evaluate the skill'. TOOLS: azsdk_typespec_generate_authoring_plan, web_fetch"
license: MIT
metadata:
  author: Azure SDK
  version: "1.0.0"
---

# Benchmark Test Local

Run all 23 TypeSpec authoring benchmark cases one by one, recording observations, and generate a standardized report.

## Triggers

Activate this skill when user wants to:
- Run benchmark tests
- Test all benchmark cases
- Generate a benchmark test report
- Evaluate the TypeSpec authoring skill performance

## Rules

1. Test each case one by one using the prompt from its `case.md`
2. Record whether the `azure-typespec-author` skill is triggered for each case
3. Record whether the `azsdk_typespec_generate_authoring_plan` MCP tool is called for each case
4. For cases 001005–001008 (interactive API versioning), record the agent-user interaction Q&A
5. Compare results against expected answers in `case.md`
6. **Always** generate `benchmark-report.md` in the repository root using the report format below

---

## Steps

| # | Action | Details |
|---|--------|---------|
| 1 | **Discover Cases** | Scan `cases/` directory for all `case.md` files. Extract case ID from folder name (e.g., `001001`), prompt from `## Prompts` or `## prompt` section, expected answer from `## answer` or `## result` section, and user interactions from `## user information collection` section (cases 001005–001008 only). |
| 2 | **Test Each Case** | For each case, feed the prompt to the agent and observe: (a) skill triggered? (b) MCP tool triggered? (c) result matches expected? (d) user interactions for 001005–001008. See evaluation criteria below. |
| 3 | **Generate Report** | Output `benchmark-report.md` in the repo root using the exact report format below. Also add a row to the README.md "Copilot CLI Execution Report" table. |

### Step 2: Evaluation Criteria

For each case, record these 4 dimensions:

| Dimension | What to record |
|-----------|---------------|
| **Skill Triggered** | Did the prompt trigger the `azure-typespec-author` skill? Record `yes` or `no`. |
| **MCP Tool Triggered** | Was `azsdk_typespec_generate_authoring_plan` called? Record `yes`, `no`, or `N/A`. Cases 001005–001008 use `web_fetch` for versioning guides instead — `N/A` is correct for those. |
| **Result Match** | Compare output against expected answer in `case.md`. Record `yes` (full match), `partial` (valid but different approach), or `no` (incorrect). |
| **User Interactions** | Cases 001005–001008 only: record each agent question and user response from `## user information collection`. |

---

## Report Format

The report MUST be saved as `benchmark-report.md` in the repository root and follow this exact structure:

````markdown
# Benchmark Test Report

**Date:** YYYY-MM-DD
**Suite:** TypeSpec Authoring Agent Benchmark
**Total Cases:** <N>

---

## Executive Summary

| Metric | Result |
|--------|--------|
| **Skill Triggered** (`azure-typespec-author`) | X/Y (Z%) ✅ |
| **MCP Tool Triggered** (`azsdk_typespec_generate_authoring_plan`) | X/Y applicable cases (Z%) ✅ |
| **Result Matches Expected** | X exact + Y partial = Z/Total ✅ |

> **Note:** 4 API versioning cases (001005–001008) correctly use agentic search via `web_fetch` instead of the MCP tool, per the skill's design. They are excluded from the MCP tool count.

---

## Results by Category

| Category | Cases | Skill ✓ | MCP Tool ✓ | Exact Match | Partial Match |
|----------|:-----:|:-------:|:----------:|:-----------:|:-------------:|
| Versioning | N | X/N | X/M* | X/N | X/N |
| ARMTemplate | N | X/N | X/N | X/N | X/N |
| LongRunningOperation | N | X/N | X/N | X/N | X/N |
| Decorators | N | X/N | X/N | X/N | X/N |
| Warning | N | X/N | X/N | X/N | X/N |
| **Total** | **N** | **X/N** | **X/M** | **X/N** | **X/N** |

\* Cases 001005–001008 are API versioning tasks that use agentic search (`web_fetch`) per the skill design, not the MCP tool. This is correct behavior.

---

## Detailed Results

### <Category> (<case_range>)

| Case | Name | Skill | MCP Tool | Match | Notes |
|------|------|:-----:|:--------:|:-----:|-------|
| NNNNNN | case-name | ✅ | ✅ | ✅ | Brief description of result. |
| NNNNNN | case-name | ✅ | ✅ | ⚠️ Partial | What differed and why both are valid. |
| NNNNNN | case-name | ✅ | N/A† | ✅ | Uses agentic search. N user interactions (see below). |

(Repeat for each category)

† API versioning cases use `web_fetch` for versioning guides per skill design — MCP tool is intentionally not called.

---

## Agent-User Interaction Details (Cases 001005–001008)

These cases require the agent to interactively collect information from the user before generating a versioning plan. The skill uses `web_fetch` to download the relevant versioning guide, then asks clarifying questions.

### Case NNNNNN — <Scenario> (N interactions)

**Scenario:** <description>

| # | Agent Question | User Response |
|---|---------------|---------------|
| 1 | "Question text" | "Answer text" |

**Expected outcome:** <description of what changes should be made>

(Repeat for each interactive case)

---

## Partial Match Analysis

(Only include this section if there are partial matches)

### Case NNNNNN — <case-name>

- **Tool approach:** What the tool suggested.
- **Expected approach:** What the case.md expects.
- **Assessment:** Why both are valid or what differs.

---

## Key TypeSpec Patterns Validated

| Pattern | Cases | Description |
|---------|-------|-------------|
| `pattern-name` | NNNNNN | What it does |
````