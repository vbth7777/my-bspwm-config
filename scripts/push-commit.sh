#!/bin/bash

# Set the commit message with the date format
COMMIT_MESSAGE=$(date +%d/%m/%Y)

# Add all changes to the Git staging area
git add -A

# Commit changes with the commit message
git commit -m "$COMMIT_MESSAGE"

# Push changes to the remote repository's master branch
git push origin HEAD:master
