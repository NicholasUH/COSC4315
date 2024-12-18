local luaunit = require('lib.luaunit')
local fib = require('src.fibonacci')

function testCanary() 
  luaunit.assertTrue(true)
end

function testFibonacci() 
  local testCases = {
    {0, {1}},
    {1, {1, 1}},
    {2, {1, 1, 2}},
    {3, {1, 1, 2, 3}},
    {5, {1, 1, 2, 3, 5, 8}},
    {8, {1, 1, 2, 3, 5, 8, 13, 21, 34}},
    {10, {1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89}},
  }

  for _, case in ipairs(testCases) do
    local N, expectedResult = case[1], case[2]
    luaunit.assertEquals(fib.fib_iterative_iterative(N), expectedResult)
  end

  for _, case in ipairs(testCases) do
    local N, expectedResult = case[1], case[2]
    luaunit.assertEquals(fib.fib_recursive_recursive(N), expectedResult)
  end

  for _, case in ipairs(testCases) do
    local N, expectedResult = case[1], case[2]
    luaunit.assertEquals(fib.fib_recursive_iterative(N), expectedResult)
  end
end

os.exit(luaunit.LuaUnit.run())
