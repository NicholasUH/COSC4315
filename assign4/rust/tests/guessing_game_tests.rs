use guessing_game::{evaluate_guess, play_guessing_game, generate_random_number, Comparison};
use std::cell::{RefCell};

#[test]
fn canary_test() {
  assert!(true);
}

#[test]
fn test_evaluate_guess_equal() {
  assert_eq!(evaluate_guess(50, 50), Comparison::EQUAL);
}

#[test]
fn test_evaluate_guess_high() {
  assert_eq!(evaluate_guess(50, 75), Comparison::HIGH);
}

#[test]
fn test_evaluate_guess_low() {
  assert_eq!(evaluate_guess(50, 25), Comparison::LOW);
}

#[test]
fn test_play_guessing_game() {
  let messages = RefCell::new(vec![]);
  let attempts = play_guessing_game(50, || 50, |result| messages.borrow_mut().push(result));

  assert_eq!(attempts, 1);
  assert_eq!(*messages.borrow(), vec![Comparison::EQUAL]);
}

#[test]
fn test_play_guessing_game_two_attempts_low() {
  let guesses = RefCell::new(vec![50, 25]); 
  let messages = RefCell::new(vec![]);
  let read_guess = || guesses.borrow_mut().pop().unwrap();

  let attempts = play_guessing_game(50, read_guess, |result| messages.borrow_mut().push(result));

  assert_eq!(attempts, 2);
  assert_eq!(*messages.borrow(), vec![Comparison::LOW, Comparison::EQUAL]);
}

#[test]
fn test_play_guessing_game_three_attempts() { 
  let guesses = RefCell::new(vec![50, 75, 25]); 
  let messages = RefCell::new(vec![]);
  let read_guess = || guesses.borrow_mut().pop().unwrap();

  let attempts = play_guessing_game(50, read_guess, |result| messages.borrow_mut().push(result));

  assert_eq!(attempts, 3);
  assert_eq!(*messages.borrow(), vec![Comparison::LOW, Comparison::HIGH, Comparison::EQUAL]);
}

#[test]
fn test_generate_random_number() {
  let target = generate_random_number(1);

  assert!(target >= 1 && target <= 100);
}

#[test]
fn test_generate_two_random_numbers() {
  assert_ne!(generate_random_number(1), generate_random_number(2));
}
