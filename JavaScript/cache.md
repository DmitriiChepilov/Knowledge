
## The Cache API In JavaScript, And How To Use It
[source](https://blog.openreplay.com/the-cache-api-in-javascript-and-how-to-use-it/)
It was first introduced in 2015

### Checking for Cache API Support
```javascript
if ('caches' in window) {
  // Cache API is supported
  // You can add your code here
} else {
  // Cache API is not supported
}
```

### Cache.add()
```javascript
caches.open("my-cache").then((cache) => {
  cache
    .add("/api/data")
    .then(() => console.log("Data added to cache."))
    .catch((error) => console.error("Error adding data to cache:", error));
});
```

### Cache.put()
```javascript
const request = new Request("/api/data");
caches.open("my-cache").then((cache) => {
  fetch(request)
    .then((response) => {
      cache
        .put(request, response)
        .then(() => console.log("Data added to cache."))
        .catch((error) => console.error("Error adding data to cache:", error));
    })
    .catch((error) => console.error("Error fetching data:", error));
});
```

### Retrieving resources from the Cache
```javascript
caches.open("my-cache").then(function (cache) {
  cache.match("/path/to/resource").then(function (response) {
    if (response) {
      // Resource found in cache
      console.log(response);
    } else {
      // Resource not found in cache
    }
  });
```

### Deleting resources from the Cache
```javascript
caches
  .open("my-cache")
  .then(function (cache) {
    cache.delete("/path/to/resource").then(function (isDeleted) {
      if (isDeleted) {
        // Resource deleted successfully
      } else {
        // Resource not found in cache
      }
  .catch(function (error) {
    // Failed to delete resource from cache
  });
```

## Difference between Cache::add and Cache::put?
[source](https://laracasts.com/discuss/channels/laravel/what-is-the-difference-between-cacheadd-and-cacheput)
The add method will only add the item to the cache if it does not already exist in the cache store.