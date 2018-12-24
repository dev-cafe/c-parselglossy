#!/usr/bin/env bash

set -eu -o pipefail

if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
  pip install --user pipenv --upgrade
elif [[ "$TRAVIS_OS_NAME" == "osx" ]]; then
  brew update &> /dev/null
  brew cask uninstall --force oclint
  brew uninstall --force --ignore-dependencies boost
  brew install gcc
  brew install pipenv
fi
