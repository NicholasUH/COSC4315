const _ = require('lodash');
const seedrandom = require('seedrandom')

const Comparison = Object.freeze({
  EQUAL: "EQUAL",
  HIGH: "HIGH",
  LOW: "LOW"
});

function evaluateGuess(target, guess) {
  return [Comparison.LOW, Comparison.EQUAL, Comparison.HIGH][Math.sign(guess - target) + 1];
}

function playGuessingGame(target, readGuess, displayResult) {
  return _(_.range(1, 100))
    .map((attempt) => [attempt, readGuess()])
    .map(([attempt, guess]) => [attempt, evaluateGuess(target, guess)])
    .map(([attempt, result]) => {
      displayResult(result);
      return [attempt, result];
    })
    .find(([_, result]) => result === Comparison.EQUAL)?.[0];
}

function generateRandomNumber(seed) {
  return Math.floor(seedrandom(seed)() * 100) + 1;
}

module.exports = { evaluateGuess, Comparison, playGuessingGame, generateRandomNumber };
