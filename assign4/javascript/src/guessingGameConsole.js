const { playGuessingGame, generateRandomNumber, Comparison } = require('./guessingGame');
const prompt = require('prompt-sync')();

const readGuess = () => parseInt(prompt("Please enter your guess (a number between 1 and 100): "), 10);

const displayResult = (result) => console.log({
  [Comparison.HIGH]: "Your guess is high!",
  [Comparison.LOW]: "Your guess is low!",
  [Comparison.EQUAL]: "Congratulations! You guessed the correct number!"
}[result]);

function main() {
  const target = generateRandomNumber(Date.now().toString());
  
  console.log("Welcome to the Guessing Game!\nTry to guess the number between 1 and 100!");
  
  const attempts = playGuessingGame(target, readGuess, displayResult);
  
  console.log(`You guessed the number in ${attempts} attempts.`);
}

main();
