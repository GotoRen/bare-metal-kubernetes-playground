#!/bin/sh

### refs: https://github.com/zendesk/helm-secrets#important-tips
for FILE in $(git diff-index HEAD --name-only | grep 'values.secrets.y\|\/secrets\/'); do
  if [ -f "$FILE" ] && ! grep -C10000 "sops:" $FILE | grep -q "version:"; then
    echo "!!!!! $FILE" 'File is not encrypted !!!!!'
    echo "Run: helm secrets enc <file path> or sops -e -i <file path>"
    exit 1
  fi
done
exit
