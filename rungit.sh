#!/bin/bash

# Set your GitHub repo URL here
REMOTE_URL="https://github.com/qarmik/-indus-vai-temporal-scaffolding.git"

# Set commit message (default "Update")
COMMIT_MSG=${1:-"Update"}

# Initialize git if not already initialized
if [ ! -d ".git" ]; then
  git init
  echo "Git repository initialized"
else
  echo "Git repository already initialized"
fi

# Configure git user if not set (replace with your name and email)
if ! git config user.name >/dev/null; then
  git config --global user.name "qarmik"
  git config --global user.email "rohitkumar.sna@gmail"
  echo "Git user configured"
fi

# Add remote if not already added
if git remote | grep origin >/dev/null; then
  echo "Remote origin already exists"
else
  git remote add origin $REMOTE_URL
  echo "Remote origin added"
fi

# Add all files to staging area
git add .

# Commit with provided message or default
git commit -m "$COMMIT_MSG"

# Push commits to remote master, set upstream if not set
git push -u origin master
