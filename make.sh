#!/bin/bash -

echo -e "\n\n---\n\n" | cat ./c_coding_guidelines.md - ./project_tree.md > README.md  &&\
	pandoc ./README.md -s -o c_coding_guidelines.pdf
