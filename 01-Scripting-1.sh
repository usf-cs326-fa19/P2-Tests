source "${TEST_DIR}/funcs.bash"
run_timeout=5

reference_run sh < "${TEST_DIR}/scripts/inspector.sh" 2> /dev/null

test_start "Scripting Support" \
    "Trailing spaces should be eliminated by your command line tokenization "\
"process, so whitespace does matter here. If your shell times out, it "\
"likely got stuck in a loop instead of exiting at the end of the script."

run ./$SHELL_NAME < "${TEST_DIR}/scripts/inspector.sh"

compare_outputs || test_end 1

# This will often cause an infinite loop if scripting isn't implemented
# correctly (specifically if child fds are left open)
run ./$SHELL_NAME < "${TEST_DIR}/scripts/leak.sh"

test_end
