#/bin/bash 
GIT_CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
git checkout $1
git add *
git commit -m "Task: Update Documentation"
git push --set-upstream origin $1
git checkout $GIT_CURRENT_BRANCH
unset GIT_CURRENT_BRANCH