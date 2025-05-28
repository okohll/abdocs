#!/bin/sh

# If a command fails then the deploy stops
set -e

git pull

# Upgrade Docsy template
# hugo mod get -u github.com/google/docsy

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
# https://github.com/google/docsy/discussions/986
hugo mod clean --all
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

cp -r public/* ../abdocs-public 

su oliver
sudo rm -r public
exit

cd ../abdocs-public
git add --all
git commit -a -m "rebuilding site $(date)"
git push origin master


