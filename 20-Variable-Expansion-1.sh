source "${TEST_DIR}/funcs.bash"

export NUMARGS="${TEST_DIR}/scripts/num-args.sh"
export VARCMD="pwd"
export TESTVAR="super awesome test variable"
export LSVAR="/etc/hostname"
script=$(cat <<"EOM"
echo SHELL is: $SHELL
file $SHELL
echo PATH is: echo $PATH
echo
echo SHELL and PATH: $SHELL   $PATH
echo
echo Running the command in VARCMD:
$VARCMD
echo
echo TESTVAR is: $TESTVAR
echo Number of args passed to echo:
$NUMARGS $TESTVAR
echo Listing LSVAR: $LSVAR ...
ls $LSVAR
EOM
)

reference_run sh <(echo "${script}") 2> /dev/null

test_start "Environment Variable Expansion"

# ---------- Test Script ----------
echo "${script}"
# -------------- End --------------

run ./$SHELL_NAME < <(echo "${script}")

compare_outputs

test_end
