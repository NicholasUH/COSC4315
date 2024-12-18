package perfect_number

import(
  fp "github.com/repeale/fp-go"
)

func IsPerfectNumberImperative(number int) bool {
  sumOfFactors := 0

  for i := 1; i < number + 1; i++ {
    if number % i == 0 {
      sumOfFactors += i
    }
  }

  return number > 1 && sumOfFactors == number * 2
}

func IsPerfectNumberFunctional(number int) bool {
  all_numbers_in_range := fp.FlatMapWithIndex(func(_ int, i int) []int { return []int{i + 1}})(make([]int, number))

  factors := fp.Filter(func(x int) bool {return number % x == 0})(all_numbers_in_range)

  return number > 1 && fp.Reduce(func(sum int, curr int) int {return sum + curr}, 0)(factors) == number * 2
}
