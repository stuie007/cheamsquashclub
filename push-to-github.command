#!/bin/bash
cd "$(dirname "$0")"
echo "Cheam Squash Club website — pushing to GitHub"
echo "=============================================="
echo ""

trap 'echo ""; read -p "Press Enter to close this window..."' EXIT

if [ ! -d .git ]; then
  echo "Setting up git repository..."
  git init
  echo "Claude outputs/" > .gitignore
fi

git add -A
if git diff --cached --quiet; then
  echo "Nothing new to commit."
else
  git commit -m "Update Cheam Squash Club website"
fi

git branch -M main

if ! git remote | grep -q '^origin$'; then
  git remote add origin "https://x-access-token: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@github.com/stuie007/cheamsquashclub.git"
fi

echo ""
echo "Pushing to https://github.com/stuie007/cheamsquashclub ..."
if git push -u origin main; then
  echo ""
  echo "SUCCESS — your website is now on GitHub."
  echo "View it at: https://github.com/stuie007/cheamsquashclub"
else
  echo ""
  echo "Something went wrong with the push (see the error above)."
fi
