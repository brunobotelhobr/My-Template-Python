#/bin/bash 
echo "Updating Documentation, point github sites to the correct branch"
echo "---------------------------------------------------------------"
GIT_CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD) > /dev/null
git checkout $1 > /dev/null
git add * > /dev/null
git commit -m "Task: Update Documentation" > /dev/null
git push --set-upstream origin $1
git checkout $GIT_CURRENT_BRANCH  > /dev/null
unset GIT_CURRENT_BRANCH  > /dev/null