#!/bin/bash

# Ralph Agentic Loop Script
# Usage: ./ralph.sh --task "Your task" --max-iterations 10

TASK=""
MAX_ITERATIONS=10
ITERATION=0
CONTEXT_FILE="context/current_state.md"

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --task) TASK="$2"; shift ;;
        --max-iterations) MAX_ITERATIONS="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

if [ -z "$TASK" ]; then
    echo "Error: Task is required."
    exit 1
fi

echo "Starting Ralph Loop for task: $TASK"

while [ $ITERATION -lt $MAX_ITERATIONS ]; do
    ((ITERATION++))
    echo "=== Iteration $ITERATION / $MAX_ITERATIONS ==="

    # 1. Check for completion condition (example: check for a specific file or content)
    if grep -q "<promise>COMPLETE</promise>" "$CONTEXT_FILE" 2>/dev/null; then
        echo "Task completed successfully!"
        exit 0
    fi

    # 2. Run the Agent (Replace with actual agent command)
    # Example: gemini-cli run --prompt "$TASK" --context "$CONTEXT_FILE"
    echo "Running agent..."
    # Placeholder for agent execution
    # output=$(gemini-cli run "$TASK") 
    
    # 3. Save output/state
    # echo "$output" >> "$CONTEXT_FILE"
    
    # Simple simulation of progress for this template
    echo "Agent finished iteration $ITERATION."
    
    # Optional: Run verification tests here
    # ./run_tests.sh
    # if [ $? -eq 0 ]; then echo "Tests passed!"; exit 0; fi

    sleep 1
done

echo "Max iterations reached without completion."
exit 1
