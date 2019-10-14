source "${TEST_DIR}/funcs.bash"

run_timeout=5

HISTFILE=/dev/null HISTSIZE=100 reference_run \
    bash < "${TEST_DIR}/scripts/history-script-1.sh" 2> /dev/null

test_start "History List"

run ./$SHELL_NAME < "${TEST_DIR}/scripts/history-script-1.sh"

compare_outputs

test_end
