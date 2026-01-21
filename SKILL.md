---
name: Ralph Agentic Loops (RAL)
description: A structured Agent Harness for long-running, autonomous coding workflows using persistent state and self-correction.
---

# Ralph Agentic Loops (RAL)

**Ralph Agentic Loops** are robust **Agent Harnesses** designed to execute complex, long-running tasks by repeatedly running an AI agent in a controlled loop. Unlike simple retry loops, a RAL Harness enforces **state persistence** to bridge the "amnesia" gap between agent sessions.

Inspired by the "Ralph Wiggum" technique and Anthropic's Agent Harness patterns.

## Core Concepts

### 1. The Harness
The Harness is the wrapper (e.g., `ralph.sh`) that controls the agent's lifecycle. It does not just "run" the agent; it:
*   Sets up the environment.
*   Enforces the existence of state artifacts.
*   Validates completion criteria.
*   Terminates loops to prevent runaway costs.

### 2. Persistent State (The "Bridge")
Since agents start fresh each iteration, they must have a reliable way to know what happened previously.
*   **`progress.md`**: A mandatory file where the agent records what it did, what failed, and what it plans to do next.
*   **`context.md`**: (Optional) A dump of relevant error logs or test results for the next iteration to analyze.

### 3. Two-Phase Execution
*   **Initialization Phase**: The agent plans the work, creates the `progress.md` file, and breaks down the task.
*   **Worker Phase**: The loop repeatedly runs the agent. The agent reads `progress.md`, executes the next step, updates `progress.md`, and exits.

## Instructions

### Step 1: Initialize
Run the harness in initialization mode to create the tracking artifacts.
```bash
./scripts/ralph.sh init --task "Refactor the authentication module to use JWT"
```

### Step 2: Execute Loop
Run the harness in worker mode to start the autonomous loop.
```bash
./scripts/ralph.sh loop --max-iterations 15
```

## Best Practices

*   **Always Update Progress**: The agent *must* be instructed to update `progress.md` at the end of every turn. If it doesn't, the loop is broken.
*   **Fail Fast**: If `progress.md` indicates a critical block/failure for > 3 iterations, the harness should stop.
*   **Commit Often**: The harness should ideally git commit after every successful iteration to create a safety net.
