local function sum_of_squares(numbers)
    local function helper(nums, sum)
        if #nums == 0 then
            return sum
        else
            return helper({ table.unpack(nums, 2) }, sum + nums[1] ^ 2)
        end
    end
    
    return helper(numbers, 0)
end

print(sum_of_squares({}))
print(sum_of_squares({1}))
print(sum_of_squares({1, 2}))
print(sum_of_squares({1, 2, 4, 7}))
