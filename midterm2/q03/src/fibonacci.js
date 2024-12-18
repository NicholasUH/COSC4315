const _ = require("lodash");

const fib = _.memoize((position) => {
    if (position === 0 || position === 1) return 1;
    return fib(position - 1) + fib(position - 2);
});

function main(){
  const result = fib(400);
  console.log(`Fibonacci value at position ${400} is:`, result);
}

main()
