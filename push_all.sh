#!/bin/sh

# Work Folder
WD=${PWD}
OD=${WD}/MYSITE

# Clean
rm ${OD}/*.html
rm ${OD}/*.php
rm -r ${OD}/images
rm -r ${OD}/uploads

# R: render 
Rscript render.R


cp *.html ${OD}/.
cp *.php ${OD}/.

cp -r images ${OD}/.

cp -r uploads ${OD}/.

cd ${OD}

# Github
git init

git add .
# Adds the files in the local repository and stages them for commit. To unstage a file, use 'git reset HEAD YOUR-FILE'.
git commit -m "First commit"
# Commits the tracked changes and prepares them to be pushed to a remote repository. To remove this commit and modify the file, use 'git reset --soft HEAD~1' and commit and add the file again.
git remote add origin https://github.com/abonaduce/SEAPR.git
# Sets the new remote
git remote -v
# Verifies the new remote URL
git push origin master
# Pushes the changes in your local repository up to the remote repository you specified as the origin

cd ${WD}
