local fun = require('lib.fun')
local fibonacci = {}

function fibonacci.fib_iterative_iterative(n)
    if n == 0 then
        return {1,}
    elseif n == 1 then
        return {1, 1}
    end

    return fun.foldl(
        function(series)
            table.insert(series, series[#series - 1] + series[#series])
            return series
        end,
        {1, 1},
        fun.range(2, n)
    )
end

function fibonacci.fib_recursive_recursive(n)
    if n == 0 then
        return {1}
    elseif n == 1 then
        return {1, 1}
    else
        local series = fibonacci.fib_recursive_recursive(n - 1)
        table.insert(series, series[#series] + series[#series - 1])
        return series
    end
end

function fibonacci.fib_recursive_iterative(n)
    local function fibHelper(n, series)
        if n == 0 then
            return {1}
        elseif n == 1 then
            return series
        end

        table.insert(series, series[#series] + series[#series - 1])
        return fibHelper(n - 1, series)
    end

    return fibHelper(n, {1, 1})
end

return fibonacci

