
## Syntax of the NOT Operator in Bash Script
In Bash, the basic syntax of NOT Operator is as follows:
```bash
if [ ! condition ]; then
# Code to execute if the condition is not true
fi
```

## Checking if a Variable Contains Only Whitespace
```bash
var="   "
if [[ -z "${var// /}" ]]; then
    echo "var contains only whitespace"
else
    echo "var contains some characters"
fi

# Output:
# var contains only whitespace
```


## How to pass the value of a variable to the standard input of a command?
```bash
printf '%s' "$var" | my_cmd
#or
printf '%s\n' "$var" | my_cmd
```

## Determine whether a file exists or not
```bash
if test -f /path/to/file; then
  echo "File exists."
fi

if ! test -f /path/to/file; then
  echo "File does not exist."
fi

# 2 files
if ! test -f "$pathToDir/package1.json" && ! test -f "$pathToDir/package-lock1.json"; then
  echo "Neither file 'package1.json' nor file 'package-lock1.json' exists in the folder '$pathToDir'"
  exit 12;
fi
```