local fun = require('lib.fun')

local function sum_of_squares(numbers)
    return fun.foldl(function(sum, curr)
        return sum + curr ^ 2
    end, 0, numbers)
end

print(sum_of_squares({}))
print(sum_of_squares({1}))
print(sum_of_squares({1, 2}))
print(sum_of_squares({1, 2, 4, 7}))