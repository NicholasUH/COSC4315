use std::collections::HashMap;
use num_bigint::BigUint;
use num_traits::One;

fn fib(position: u64, cache: &HashMap<u64, BigUint>) -> (BigUint, HashMap<u64, BigUint>) {
  if position == 0 || position == 1 {
    return (BigUint::one(), cache.clone());
  }

  if cache.contains_key(&position) {
    return (cache[&position].clone(), cache.clone());
  }

  let (fib1, cache1) = fib(position - 1, cache);
  let (fib2, cache2) = fib(position - 2, &cache1);

  let result = &fib1 + &fib2;
  (
    result.clone(),
    cache2
      .into_iter()
      .chain([(position, result)].into_iter())
      .collect(),
  )
}

fn main() {
    let position: u64 = 400;
    let (result, _) = fib(position, &HashMap::new());
    println!("Fibonacci value at position {} is {}", position, result);
}
