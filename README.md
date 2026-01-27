# Ralph Agentic Loops (RAL)

**Ralph Agentic Loops** are a pure-agent methodology for long-running autonomous workflows.

## 🚀 Quick Start (Bootstrap)

To turn **any** project folder into a RAL workspace, simply copy and paste the following prompt into your AI Agent Main Chat (Gemini CLI, OpenCode, Claude Code):

---

### 📋 The Bootstrap Prompt

```markdown
I want to install and initialize the **Ralph Agentic Loop (RAL)** skill in this workspace.

Please perform the following autonomous setup:

1.  **Install the Skill**:
    -   Clone the RAL repository: `git clone https://github.com/sxa101/ral.git .agent/skills/ral`
    -   (If `.agent/skills` does not exist, create it first).

2.  **Adopt the Protocol**:
    -   Read the file `.agent/skills/ral/RAL_PROTOCOL.md`.
    -   Adopt its rules as your **System Instructions** for this session.

3.  **Initialize State**:
    -   Create a file named `progress.md` (copy from `.agent/skills/ral/templates/progress.md`).
    -   Set the Goal in `progress.md` to: [INSERT USER GOAL HERE]
    -   **CRITICAL**: Ensure the Status is set to `DESIGN_PHASE` and the `## Design Consensus` section is present.

4.  **Start Generation**:
    -   Immediately execute the first step defined in your new protocol (System Design Review).
```

---

That's it. The agent will fetch the latest protocol from GitHub, install it locally, and begin the **Design Quorum** phase.
