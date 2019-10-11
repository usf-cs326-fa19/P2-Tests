source "${TEST_DIR}/funcs.bash"
run_timeout=2

expected_run sh < "${TEST_DIR}/scripts/inspector.sh" 2> /dev/null

test_start "Scripting Support" \
    "Trailing spaces should be eliminated by your command line tokenization "\
"process, so whitespace does matter here. If your shell times out, it "\
"likely got stuck in a loop instead of exiting at the end of the script."

run ./$SHELL_NAME < "${TEST_DIR}/scripts/inspector.sh" 2> /dev/null
compare <(echo "${expected_output}") <(echo "${program_output}")

test_end
