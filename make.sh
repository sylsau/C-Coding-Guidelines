#!/bin/bash -

echo -e "\n\n---\n\n" | cat ./c_coding_guidelines.md - ./project_hierarchy_standard.md > README.md  &&\
	pandoc ./README.md -V geometry="margin=5pc" -s -o c_coding_guidelines.pdf
