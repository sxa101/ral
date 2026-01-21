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
        # In a real scenario, this calls the agent executable.
        # For this template, we simulate the agent.
        echo "Running Agent (simulated)..."
        
        # PROMPT FOR AGENT:
        # "You are a Ralph Loop worker. Read $PROGRESS_FILE to understand the context.
        #  Execute the next step.
        #  Update $PROGRESS_FILE with your action and result.
        #  If finished, set Status to COMPLETE."
        
        # ... Agent processes ...

        # 3. Validation / Git Commit
        # if git diff --quiet; then
        #    echo "No changes made this iteration."
        # else
        #    git commit -am "Ralph Loop Iteration $ITERATION"
        # fi

        sleep 1
    done

    echo "Max iterations reached. Loop finished without explicit completion."
    exit 1
}

# Execute Command
if [ "$COMMAND" == "init" ]; then
    init_loop
elif [ "$COMMAND" == "loop" ]; then
    run_loop
fi
