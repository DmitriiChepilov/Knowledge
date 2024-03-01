
## Passing a string with spaces as a function argument
```bash
function myFunction()
{
  echo "$1"
  echo "$2"
  echo "$3"
}

myFunction "firstString" "second string with spaces" "thirdString"

# Output:
#firstString
#second string with spaces
#thirdString
```