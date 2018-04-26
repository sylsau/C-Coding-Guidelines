#!/bin/bash -
set -e -E

OUT_PDF="./c_coding_guidelines.pdf"
BREAK="/tmp/brk"
trap 'rm -v $BREAK' EXIT

echo -e "\n\n---\n\n" > "$BREAK"
cat ./syntax.md "$BREAK" ./file_organization.md "$BREAK" ./references.md > README.md
echo "\\maketitle \\vfill \\tableofcontents \\vfill  \\newpage" | \
    pandoc - ./README.md -V title="C Coding Guidelines" -V geometry="margin=5pc" -s -o "$OUT_PDF"
[[ $? -eq 0 ]] && [[ $1 ]] && xdg-open "$OUT_PDF" &
