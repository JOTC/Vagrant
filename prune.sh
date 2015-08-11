#!/bin/bash

git filter-branch --prune-empty --index-filter 'git rm --cached --ignore-unmatch status/* server/* .codeclimate.yml .gitignore .travis.yml README.md Vagrantfile' HEAD