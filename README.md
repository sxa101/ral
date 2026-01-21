# Ralph Agentic Loops (RAL)

**Ralph Agentic Loops** are robust **Agent Harnesses** designed to execute complex, long-running tasks by repeatedly running an AI agent in a controlled loop.

## Quick Start: Self-Contained Setup

To set up RAL in any project (new or existing) without cloning this repo, simply **copy and paste the following prompt** into your AI Assistant (Claude, Gemini, etc.):

---

### 📋 Copy This Prompt

```markdown
I want you to set up the **Ralph Agentic Loop (RAL)** harness in this directory. This requires creating a script and a template to enable autonomous, iterative loops with persistent state.

Please perform the following actions:

1.  **Create the directory structure**:
    -   `scripts/`
    -   `templates/`

2.  **Create `templates/progress.md`** with this content:
    ```markdown
    # Ralph Loop Progress Tracker

    **Goal**: {{TASK_DESCRIPTION}}
    **Status**: IN_PROGRESS

    ## Recent Activity
    | Iteration | Action Taken | Result |
    | :--- | :--- | :--- |
    | 0 | Initialization | Started task. |

    ## Current Context
    *   **What was done last**: N/A
    *   **Current Blocker/Error**: None
    *   **Plan for Next Step**: Analyze requirements and break down tasks.

    ## Completion Checklist
    - [ ] Task Breakdown Created
    - [ ] Implementation Started
    - [ ] Verification Passed

    <!-- Valid Statuses: IN_PROGRESS, BLOCKED, COMPLETE -->
    ```

3.  **Create `scripts/ralph.sh`** with this content:
    ```bash
    #!/bin/bash

    # Ralph Agentic Loop Harness
    # Usage: 
    #   ./ralph.sh init --task "Your task"
    #   ./ralph.sh loop --max-iterations 10

    COMMAND=""
    TASK=""
    MAX_ITERATIONS=10
    PROGRESS_FILE="progress.md"
    TEMPLATE_FILE="templates/progress.md"

    # Parse arguments
    while [[ "$#" -gt 0 ]]; do
        case $1 in
            init) COMMAND="init" ;;
            loop) COMMAND="loop" ;;
            --task) TASK="$2"; shift ;;
            --max-iterations) MAX_ITERATIONS="$2"; shift ;;
            *) echo "Unknown parameter passed: $1"; exit 1 ;;
        esac
        shift
    done

    if [ -z "$COMMAND" ]; then
        echo "Usage: ./ralph.sh [init|loop] [options]"
        exit 1
    fi

    # Function: Initialize the Loop
    init_loop() {
        if [ -z "$TASK" ]; then
            echo "Error: --task is required for initialization."
            exit 1
        fi
        
        if [ -f "$PROGRESS_FILE" ]; then
            echo "Warning: $PROGRESS_FILE already exists. Overwrite? (y/n)"
            read -r response
            if [[ "$response" != "y" ]]; then
                echo "Initialization aborted."
                exit 0
            fi
        fi

        echo "Initializing Ralph Loop..."
        # Create progress file from template or default
        if [ -f "$TEMPLATE_FILE" ]; then
            cp "$TEMPLATE_FILE" "$PROGRESS_FILE"
            # Simple template substitution
            sed -i "s/{{TASK_DESCRIPTION}}/$TASK/g" "$PROGRESS_FILE"
        else
            echo "# Ralph Loop Progress Tracker" > "$PROGRESS_FILE"
            echo "**Goal**: $TASK" >> "$PROGRESS_FILE"
            echo "**Status**: IN_PROGRESS" >> "$PROGRESS_FILE"
        fi
        
        echo "Initialized $PROGRESS_FILE. Ready to loop."
    }

    # Function: Run the Worker Loop
    run_loop() {
        if [ ! -f "$PROGRESS_FILE" ]; then
            echo "Error: $PROGRESS_FILE not found. Run 'init' first."
            exit 1
        fi

        echo "Starting Ralph Loop (Max Iterations: $MAX_ITERATIONS)"
        ITERATION=0
        
        while [ $ITERATION -lt $MAX_ITERATIONS ]; do
            ((ITERATION++))
            echo "=== Iteration $ITERATION / $MAX_ITERATIONS ==="

            # 1. Read Status
            CURRENT_STATUS=$(grep "**Status**:" "$PROGRESS_FILE" | awk '{print $2}')
            if [ "$CURRENT_STATUS" == "COMPLETE" ]; then
                echo "Task marked as COMPLETE in $PROGRESS_FILE. Exiting success."
                exit 0
            fi

            # 2. Run Agent
            echo "Running Agent..."
            # NOTE: In a real environment, you would call the agent CLI here.
            # Example: gemini-cli run --prompt "Read progress.md, execute next step, update progress.md"
            
            # For manual/demo purposes, we pause or expect external execution
            echo "Agent execution required. Please update $PROGRESS_FILE and press Enter to continue (or Ctrl+C to stop)..."
            # read -r _

            # 3. Validation
            sleep 1
        done

        echo "Max iterations reached."
        exit 1
    }

    # Execute Command
    if [ "$COMMAND" == "init" ]; then
        init_loop
    elif [ "$COMMAND" == "loop" ]; then
        run_loop
    fi
    ```

4.  **Final Instructions**:
    Once created, verify the files exist and tell me how to run the initialization command.
```

---

## How to use
1.  **Initialize**: `./scripts/ralph.sh init --task "Your Task"`
2.  **Run**: `./scripts/ralph.sh loop`
