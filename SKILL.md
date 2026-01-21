---
name: Ralph Agentic Loops
description: Autonomous AI coding workflows that repeatedly run an AI agent on a task until a defined completion condition is met.
---

# Ralph Agentic Loops (RAL)

Ralph Agentic Loops are autonomous AI coding workflows that repeatedly run an AI agent on a task until a defined completion condition is met. The core idea is to keep feeding the same prompt to an AI agent until it successfully completes a task, using persistent state in files and git history.

## Key Features

1.  **Iterative Execution**: The loop runs continuously, with each iteration starting fresh (clean context).
2.  **Completion Verification**: The loop checks for objective criteria (e.g., passing tests, specific output tag).
3.  **Long-Term Memory**: Progress is stored in the filesystem (e.g., prd.json, progress.txt, git commits).
4.  **Self-Correction**: Failures become feedback. The agent learns from its own output.

## How It Works

1.  **Define Task**: Create a clear task with explicit completion criteria.
2.  **Run Loop**: Execute the `scripts/ralph.sh` script.
3.  **Iteration Cycle**:
    *   AI works on the task (from PRD/requirements).
    *   AI commits changes.
    *   Loop checks completion condition.
    *   If not complete, re-run with updated context.
4.  **Termination**: Loop ends on success or max iterations.

## Best Practices

-   **Clear Signals**: Use signals like `<promise>COMPLETE</promise>` in the output or specific file states.
-   **Phased Approach**: Break large tasks into phases (e.g., "Phase 1: Auth").
-   **Limit Iterations**: Always set a max-iteration limit to prevent infinite loops.
-   **TDD Prompts**: Use Test Driven Development style prompts to guide iterative improvement.

## Usage

To use this skill, you can run the provided helper script `scripts/ralph.sh`.

```bash
./scripts/ralph.sh --task "Your task description" --max-iterations 10
```
