#!/bin/bash

cd $(dirname "$0")/..

if [ -e "ci/deploy_key" ]; then
  eval $(ssh-agent -s)
  ssh-add ci/deploy_key
fi

# Use ssh.
git remote rm origin
git remote add origin git@github.com:dexon-foundation/wiki.git
git fetch origin

git submodule update
git -C src pull origin master
git commit -am 'Update src refs'
mdbook build

git checkout gh-pages
cp -r book/* .
rm -rf book

git add .
git commit -am 'Update wiki'
git push origin gh-pages

git checkout master
git push origin master
