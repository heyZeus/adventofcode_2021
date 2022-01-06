
local function lines_in(file)
   local lines = {}
   for line in io.lines(file) do
      local iterator = line:gmatch("(%d)")
      if iterator then
         table.insert(lines, line)
      end
   end
   return lines
end

local function binary(value)
   return tonumber(value, 2)
end

local function calc_rating(rows, use_majority)
   local i = 1
   while #rows > 1 do
      local ones = {}
      local zeros = {}

      for _, row in pairs(rows) do
         local bit = row:sub(i,i)
         local add_to_table = bit == '1' and ones or zeros
         table.insert(add_to_table, row)
      end

      local ones_majority = #ones >= #zeros
      if use_majority then
         rows = ones_majority and ones or zeros
      else
         rows = ones_majority and zeros or ones
      end

      i = i + 1
   end
   return rows[1]
end

local lines = lines_in('./input.txt')
assert(#lines > 0, "Empty input file")
local oxygen_rating = calc_rating(lines, true)
local co2_rating = calc_rating(lines, false)

print(oxygen_rating)
print(co2_rating)
print(binary(co2_rating) * binary(oxygen_rating))
