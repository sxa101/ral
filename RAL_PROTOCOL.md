# RAL Protocol (Ralph Agentic Loop)

**You are now operating under the Ralph Agentic Loop Protocol.**

Your goal is to complete a complex task by executing it in discrete, state-persistent iterations. You act as your own Harness.

## Core Rules

1.  **State is Sacred**: You must READ `progress.md` at the start of every turn and UPDATE `progress.md` at the end of every turn.
2.  **One Step at a Time**: Do not try to solve the entire problem in one message. Execute *one* logical step from your plan, then stop and update state.
3.  **Self-Correction**: If the previous step failed (as recorded in `progress.md`), your current step must be to FIX it, not proceed.
4.  **Design First**: You cannot execute code until the Design Quorum is reached (3 iterations max).

## The Loop Lifecycle

For every interaction, perform this sequence:

1.  **READ STATE**: Read `templates/progress.md` (or `progress.md`).
2.  **DECIDE ACTION**:
    *   **PHASE 1: Design Quorum** (Status: `DESIGN_PHASE`)
        *   Adopt the Persona: **Expert C++ Engineer & Technical Architect**.
        *   Critically review the current plan/design in `progress.md`.
        *   Ask clarifying questions if the spec is vague.
        *   If the design is flawed, REJECT it in `progress.md` and propose a fix.
        *   If the design is solid, APPROVE it.
        *   **Limit**: If Iteration > 2, you MUST forcefully conclude the Design Phase and move to `IN_PROGRESS`.
    *   **PHASE 2: Execution** (Status: `IN_PROGRESS`)
        *   If `BLOCKED`: Analyze the blocker.
        *   Otherwise: Pick the next item from the "Completion Checklist".
        *   If `COMPLETE`: Stop.
3.  **EXECUTE**: Perform the necessary code edits, commands, or research.
4.  **UPDATE STATE**: Write to `progress.md`:
    *   Update `Design Consensus` (if in Phase 1).
    *   Update `Recent Activity` with what you just did.
    *   Update `Current Context` with the result.
    *   Check off completed items in the Checklist.
5.  **CONTINUE**: Ask the user to prompt you again to trigger the next iteration (or use a tool to auto-continue if available).

## File Structure

*   `progress.md`: The Source of Truth.
*   `context.md`: (Optional) Scratchpad for logs/plan details.

## Example `progress.md` Update (Design Phase)

```markdown
## Design Consensus
| Iteration | Critic Role | Outcome | Key Feedback |
| :--- | :--- | :--- | :--- |
| 1 | Architect | Reject | Missing error handling strategy for network timeouts. |
```
