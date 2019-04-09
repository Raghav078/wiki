#!/bin/bash

git submodule update
git -C wiki.wiki pull origin master
git commit -am 'Update wiki.wiki refs'
gitbook build wiki.wiki

git checkout gh-pages
cp -r wiki.wiki/_book/* .
rm -rf wiki.wiki/_book

git add .
git commit -am 'Update wiki'
git push origin gh-pages

git co master
git push origin master
