@echo off
git for-each-ref --sort=-committerdate --format="%%(refname:short) %%(committerdate:relative)" refs/heads/