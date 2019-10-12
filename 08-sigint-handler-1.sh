source "${TEST_DIR}/funcs.bash"

run_timeout 5

trap '#^C Killed me!' INT

script=$(cat <<EOM
${TEST_DIR}/scripts/kill-parent.sh
sleep 1
echo It worked
EOM
)

test_start "^C should be ignored by the shell" \
    "NOTE: this test runs in scripting mode; make sure the prompt is not printed by SIGINT handler"

run ./$SHELL_NAME < <(echo "${script}")

compare <(echo "It worked") <(echo "${program_output}")

test_end
