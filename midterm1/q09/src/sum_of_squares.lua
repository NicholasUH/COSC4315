local function sum_of_squares(numbers)
    if #numbers == 0 then
        return 0
    else
        return (numbers[1] ^ 2) + sum_of_squares({ table.unpack(numbers, 2) })
    end
end

print(sum_of_squares({}))
print(sum_of_squares({1}))
print(sum_of_squares({1, 2}))
print(sum_of_squares({1, 2, 4, 7}))
