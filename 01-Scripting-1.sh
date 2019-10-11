source "${TEST_DIR}/funcs.bash"
run_timeout=2
reference_run sh < "${TEST_DIR}/scripts/inspector.sh" 2> /dev/null

test_start "Scripting Support" \
    "Trailing spaces should be eliminated by your command line tokenization process"

run ./$SHELL_NAME < "${TEST_DIR}/scripts/inspector.sh" 2> /dev/null
compare <(echo "${expected_output}") <(echo "${program_output}")

test_end
