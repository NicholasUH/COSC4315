use guessing_game::{play_guessing_game, generate_random_number, Comparison};
use std::io::{self, Write};
use std::time::{SystemTime, UNIX_EPOCH};

fn main() { 

  let target = generate_random_number(SystemTime::now().duration_since(UNIX_EPOCH).unwrap().as_secs()); 

  println!("Welcome to the Guessing Game!");
  println!("I'm thinking of a number between 1 and 100. Try to guess it!");

  let read_guess = || {
    print!("Please enter your guess (a number between 1 and 100): ");
    io::stdout().flush().unwrap();
    io::stdin().lines().next().unwrap().unwrap().trim().parse().unwrap()
  };

  let display = |result: Comparison| match result {
    Comparison::HIGH => println!("Your guess is high!"),
    Comparison::LOW => println!("Your guess is low!"),
    Comparison::EQUAL => println!("Congratulations! You guessed the correct number!"),
  };

  let attempts = play_guessing_game(target, read_guess, display);
  
  println!("You guessed the number in {} attempts.", attempts);
}
