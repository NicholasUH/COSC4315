use std::{
  cmp::Ordering,
};
use rand::{Rng, SeedableRng, rngs::StdRng};
use Comparison::{EQUAL, HIGH, LOW};

#[derive(Debug, PartialEq, Copy, Clone)]
pub enum Comparison {
  HIGH,
  LOW,
  EQUAL,
}

pub fn evaluate_guess(target: i32, guess: i32) -> Comparison {
  match guess.cmp(&target) {
    Ordering::Equal => EQUAL,
    Ordering::Greater => HIGH,
    Ordering::Less => LOW,
  }
}

pub fn play_guessing_game(target: i32, read_guess: impl Fn() -> i32, display: impl Fn(Comparison)) -> i32 {
  std::iter::repeat_with(read_guess)
    .map(|guess| evaluate_guess(target, guess))
    .inspect(|&result| display(result))
    .enumerate()
    .skip_while(|&(_, result)| result != Comparison::EQUAL)
    .map(|(attempts, _)| attempts)
    .next()
    .unwrap() as i32
    + 1
}

pub fn generate_random_number(seed: u64) -> i32 {
  StdRng::seed_from_u64(seed).gen_range(1..=100)
}
