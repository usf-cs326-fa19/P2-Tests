source "${TEST_DIR}/funcs.bash"

run_timeout=5

script=$(cat <<EOM

/bin/echo System Information
/bin/echo ------------------
/bin/echo -n Hostname: 
cat /proc/sys/kernel/hostname
echo -n Kernel Version: 
cat /proc/sys/kernel/osrelease
echo Logged in Users:
who
 
EOM
)

reference_run sh <(echo "${script}") 2> /dev/null

test_start "Basic process execution both from PATH and with absolute path"

# ---------- Test Script ----------
echo "${script}"
# -------------- End --------------

run ./$SHELL_NAME < <(echo "${script}") 2> /dev/null

compare <(echo "${reference_output}") <(echo "${program_output}")

test_end
