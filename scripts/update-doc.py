import argparse  # type: ignore
import os  # type: ignore

print("----------------------------------------------------------------")
print("Updating Documentation, point github sites to the correct branch")
print("----------------------------------------------------------------")

parser = argparse.ArgumentParser(description="Update Documentation")
parser.add_argument("branch", type=str, help="Branch to update")
args = parser.parse_args()

branch = args.branch

print(os.system("git status"))
os.system("git checkout master")
print("Current Branch: " + str(os.system("git rev-parse --abbrev-ref HEAD) > /dev/null")))
CURRENT_BRANCH = str(os.system("git rev-parse --abbrev-ref HEAD) > /dev/null"))
os.system("git checkout " + branch + " > /dev/null")
os.system("git add * > /dev/null")
os.system("git commit -m 'Task: Update Documentation' > /dev/null")
os.system("git push --set-upstream origin " + branch)
os.system("git checkout " + CURRENT_BRANCH + "  > /dev/null")
