
## forEach


### Compute the sum
```javascript
let sum = 0;
const numbers = [65, 44, 12, 4];
numbers.forEach(function myFunction(item) {
  sum += item;
});
```
result: 125

### Multiply each element
```javascript
const numbers = [65, 44, 12, 4];
numbers.forEach(function myFunction(item, index, arr) {
  arr[index] = item * 10;
});
```
result `[650, 440, 120, 40]`