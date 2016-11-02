#!/bin/bash

git clone https://github.com/lukasmartinelli/hadolint
cd hadolint
stack setup
stack build --copy-bins