#!/bin/bash
#####
# .git/hooks/commit-msg
#
# ./commit-msg.sh $1
# if [ $? != 0]; then
#   exit 1
# fi
# exit 0
#####

# for test
# read -p "commit msg: " COMMIT_MSG

COMMIT_MSG=`cat $1`

# validate format
FIELD_COUNT=`echo $COMMIT_MSG | awk -F ':' '{print NF}'`
if [ $FIELD_COUNT -lt 3 ]; then
  echo "\"$COMMIT_MSG\" is invalid format. Format: '{type}: {sub-type}: {message}'"
  exit 1
fi

# validate type
VALID_TYPES=("feat" "chore" "fix" "test" "docs" "refactor")
TYPE=`echo $COMMIT_MSG | awk -F ':' '{print $1}' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//'`
if ! `echo ${VALID_TYPES[@]} | grep -q $TYPE`; then
  echo "\"$TYPE\" is invalid type."
  exit 1
fi

# validate sub-type
SCRIPT_DIR=$(dirname "$(realpath "$0")")
VALID_SUB_TYPES=()
for d in $SCRIPT_DIR/*/; do
  VALID_SUB_TYPES+=`basename $d`
done
VALID_SUB_TYPES+="Other"

SUB_TYPE=`echo $COMMIT_MSG | awk -F ':' '{print $2}' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//'`
if ! `echo ${VALID_SUB_TYPES[@]} | grep -q $SUB_TYPE`; then
  echo "\"$SUB_TYPE\" is invalid subtype."
  exit 1
fi

exit 0
