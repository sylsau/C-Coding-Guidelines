#!/bin/bash -

echo "-----" | cat ./c_coding_guidelines.md - ./project_tree.md > README.md

pandoc ./c_coding_guidelines.md -s -o c_coding_guidelines.pdf
