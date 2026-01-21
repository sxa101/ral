---
name: Ralph Agentic Loops (RAL)
description: A protocol-based Agent Harness for purely agentic, autonomous iteration without external scripts.
---

# Ralph Agentic Loops (RAL)

**Ralph Agentic Loops** enable an AI agent to act as its own "Harness" for long-running tasks. By adopting the **RAL Protocol**, the agent guarantees that state is preserved between messages, effectively bridging the context window gap.

## How it Works

Instead of running a python or bash script, you **inject the Protocol** into the agent's context. The agent then follows a strict lifecycle:

1.  **Read Progress**: The agent checks `progress.md`.
2.  **Execute Step**: The agent performs *one* unit of work.
3.  **Update Progress**: The agent records its state.
4.  **Loop**: The agent requests the next prompt.

## The Protocol

The core of this skill is the `RAL_PROTOCOL.md` file, which serves as the "System Prompt" for the loop. It instructs the agent to value **State** over **Speed**.

## Best Practices

*   **Atomic Commits**: The agent should git commit after every successful state update.
*   **Detailed Logging**: The `progress.md` file should contain enough detail that a *fresh* agent instance could pick up the work instantly.
*   **Stop Conditions**: The agent must respect the `COMPLETE` status and stop execution.
