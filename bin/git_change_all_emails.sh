#!/bin/bash -eu
OLD_EMAIL=$1
NEW_EMAIL=$2
git filter-branch --env-filter '
OLD_EMAIL="'$OLD_EMAIL'"
NEW_EMAIL="'$NEW_EMAIL'"
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
  export GIT_COMMITTER_EMAIL="$NEW_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
  export GIT_AUTHOR_EMAIL="$NEW_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags