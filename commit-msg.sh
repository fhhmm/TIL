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

COMMIT_MSG=`cat $1`

# validate format
FIELD_COUNT=`echo $COMMIT_MSG | awk -F ':' '{print NF}'`
if [ $FIELD_COUNT -lt 3 ]; then
  echo "\"$COMMIT_MSG\" is invalid format. Format: '{type}: {sub-type}: {message}'"
  exit 1
fi

# validate type
TYPE=`echo $COMMIT_MSG | awk -F ':' '{print $1}' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//'`
case $TYPE in
  "feat"|"chore"|"fix"|"test"|"docs"|"refactor")
    ;;
  *)
    echo "\"$TYPE\" is invalid type."
    exit 1
esac

# validate sub-type
SUB_TYPE=`echo $COMMIT_MSG | awk -F ':' '{print $2}' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//'`
case $SUB_TYPE in
  "Scala"|"Python"|"Go"|"MySQL"|"AWS"|"GCP"|"Git"|"Other")
    ;;
  *)
    echo "\"$SUB_TYPE\" is invalid subtype."
    exit 1
esac

exit 0
