source "${TEST_DIR}/funcs.bash"

run_timeout=20
reference_run sh < "${TEST_DIR}/scripts/long.sh"

test_start "Long command lines" \
    "Your shell should ignore arguments if too many were given."

# Ignore log messages because they're going to be huge if the line is printed:
run ./$SHELL_NAME < "${TEST_DIR}/scripts/too-long.sh" 2> /dev/null

run ./$SHELL_NAME < "${TEST_DIR}/scripts/long.sh"

compare <(echo "${reference_output}") <(echo "${program_output}")

test_end
