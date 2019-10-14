source "${TEST_DIR}/funcs.bash"

run_timeout=5

script=$(cat <<EOM
set -o history    # Your shell can ignore this
set -o histexpand # Your shell can ignore this
ls -1 -t -r /
!!
uname -a
!!
oeiwiowejweo
!!
echo Goodbye
!!
EOM
)

HISTFILE=/dev/null HISTSIZE=100 reference_run \
    bash <(echo "${script}") 2> /dev/null

test_start "History Execution !!"

# ---------- Test Script ----------
echo "${script}"
# -------------- End --------------

run ./$SHELL_NAME < <(echo "${script}")

compare_outputs

test_end
