package namcharoen_tran;

import java.util.stream.IntStream;

public interface PerfectNumber {
  public static boolean isPerfectNumberImperative(int number) {
    var sumOfFactors = 0;

    for (var i = 1; i < number + 1; i++) {
      if (number % i == 0) {
        sumOfFactors += i;
      }
    }

    return number > 1 && sumOfFactors == number * 2;
  }

  public static boolean isPerfectNumberFunctional(int number) {
    return number > 1 &&
      IntStream.rangeClosed(1, number) 
        .filter(i -> number % i == 0)
        .sum() == number * 2;
  }
}
