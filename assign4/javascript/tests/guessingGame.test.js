const { evaluateGuess, Comparison, playGuessingGame, generateRandomNumber } = require('../src/guessingGame');

describe("Canary test", () => {
  it("should always pass", () => {
    expect(true).toBe(true);
  });
});

describe("evaluateGuess", () => {
  it("should return Comparison.EQUAL when guess matches the target", () => {
    expect(evaluateGuess(50, 50)).toBe(Comparison.EQUAL);
  });

  it("should return Comparison.LOW when guess is lower than the target", () => {
    expect(evaluateGuess(50, 25)).toBe(Comparison.LOW);
  });

  it("should return Comparison.HIGH when guess is higher than the target", () => {
    expect(evaluateGuess(50, 75)).toBe(Comparison.HIGH);
  });
});

describe("playGuessingGame", () => {
  it("should return correct number of attempts and message for one attempt", () => {
    let messages = []

    const attempts = playGuessingGame(
      50,          
      () => 50,
      (result) => messages.push(result)
    );

    expect(attempts).toBe(1)
    expect(messages).toStrictEqual([Comparison.EQUAL]);
  });

  it("should return 2 attempts and correct messages for two attempts (LOW)", () => {
    let guesses = [50, 25];
    let messages = [];

    const attempts = playGuessingGame(
      50,
      () => guesses.pop(),
      (result) => messages.push(result)
    );

    expect(attempts).toBe(2);
    expect(messages).toStrictEqual([Comparison.LOW, Comparison.EQUAL]);
  });

  it("should return 3 attempts and correct messages for three attempts (LOW, HIGH, EQUAL)", () => {
    let guesses = [50, 75, 25];
    let messages = [];

    const attempts = playGuessingGame(
      50,
      () => guesses.pop(),
      (result) => messages.push(result)
    );

    expect(attempts).toBe(3);
    expect(messages).toStrictEqual([Comparison.LOW, Comparison.HIGH, Comparison.EQUAL]);
  });
});

describe("generateRandomNumber", () => {
  it("should return a number between 1 and 100", () => {
    const target = generateRandomNumber(1);

    expect(target).toBeGreaterThanOrEqual(1);
    expect(target).toBeLessThanOrEqual(100);
  });

  it("should return two different number for different seed values", () => {
    expect(generateRandomNumber(1)).not.toBe(generateRandomNumber(2));
  });
});
