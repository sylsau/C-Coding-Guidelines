#!/bin/bash -
set -e -E

OUT_PDF="./c_coding_guidelines.pdf"
BREAK="/tmp/ccg.brk"
TEMP="/tmp/ccg.tmp"
trap 'rm -v "$BREAK" "$TEMP"' EXIT

echo -e "\n\n---\n\n" > "$BREAK"
cat ./syntax.md "$BREAK" ./file_organization.md "$BREAK" ./references.md > $TEMP
echo "\\maketitle \\vfill \\tableofcontents \\vfill  \\newpage" | \
    pandoc - $TEMP -V title="C Coding Guidelines" -V geometry="margin=5pc" -s -o "$OUT_PDF"
echo -e "# C CODING GUIDELINES\n" | cat - $TEMP > ./README.md
[[ $? -eq 0 ]] && [[ $1 ]] && xdg-open "$OUT_PDF" &
