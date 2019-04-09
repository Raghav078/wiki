#!/bin/bash

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

git co master
git push origin master
