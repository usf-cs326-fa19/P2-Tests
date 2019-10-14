source "${TEST_DIR}/funcs.bash"

run_timeout=5

script=$(cat <<EOM
setenv shell_test_variable_1 This-is-a-really-long-environment-variable-value
setenv lions
setenv shell_test_variable_2 Tigers
setenv shell_test_variable_3 Toitles
setenv shell_test_variable_4
setenv
${TEST_DIR}/scripts/print-env.sh
echo Test Complete
EOM
)

expected_output=$(cat <<EOM
This-is-a-really-long-environment-variable-value
Tigers
Toitles
Test Complete
EOM
)

test_start "setenv built-in command"

# ---------- Test Script ----------
echo "${script}"
# -------------- End --------------

run ./$SHELL_NAME < <(echo "${script}")

compare <(echo "${expected_output}") <(echo "${program_output}")

test_end
