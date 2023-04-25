import argparse  # type: ignore
import os  # type: ignore

print("----------------------------------------------------------------")
print("Updating Documentation, point github sites to the correct branch")
print("----------------------------------------------------------------")

#Get the tirst argument
parser = argparse.ArgumentParser()
parser.add_argument("branch", help="The branch to update the documentation for")
args = parser.parse_args()
branch = args.branch

CURRENT_BRANCH = str(os.system("git rev-parse --abbrev-ref HEAD) > /dev/null"))
print("Current Branch: " + CURRENT_BRANCH)

os.system("git checkout " + branch + " > /dev/null")
print("Current Branch: " + branch)

os.system("git add * > /dev/null")
os.system("git commit -m 'Task: Update Documentation' > /dev/null")
os.system("git push --set-upstream origin " + branch)
os.system("git checkout " + CURRENT_BRANCH + "  > /dev/null")
