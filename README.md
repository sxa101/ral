# Ralph Agentic Loops (RAL)

**Ralph Agentic Loops** are a pure-agent methodology for long-running autonomous workflows.

## 🚀 Quick Start (Bootstrap)

To turn **any** project folder into a RAL workspace, simply copy and paste the following prompt into your AI Agent Main Chat:

---

### 📋 The Bootstrap Prompt

```markdown
I want to initialize this workspace for **Ralph Agentic Loops (RAL)**. 

Please perform the following autonomous setup:

1.  **Adopt the Protocol**: Read the following rules and adopt them as your System Instructions for this task:
    > **RAL Protocol**:
    > 1. You check `progress.md` at the start of every turn.
    > 2. You execute exactly one step of work.
    > 3. You update `progress.md` with the results (Pass/Fail) at the end of every turn.
    > 4. You never proceed if the previous step failed—you fix it first.

2.  **Initialize State**:
    Create a file named `progress.md` with this content:
    """
    # Ralph Loop Progress Tracker
    **Goal**: [INSERT USER GOAL HERE]
    **Status**: IN_PROGRESS
    
    ## Recent Activity
    | Iteration | Action Taken | Result |
    | :--- | :--- | :--- |
    | 0 | Initialization | Setup RAL. |
    
    ## Checklist
    - [ ] [First Step]
    """

3.  **Start Generation**:
    Once the file is created, immediately read it, determining the Goal from me (prompt me if needed), and then execute the first step in the Checklist.
```

---

That's it. The agent will now create its own harness and begin looping through the tasks defined in `progress.md`.
