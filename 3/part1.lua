
print("Day 3")
print("")

local data = {
   columns_one = {},
   rows = {}
}

local function binary(value)
   return tonumber(value, 2)
end

-- collect column counts
for line in io.lines('./input.txt') do
   local iterator = line:gmatch("(%d)")
   if iterator then
      table.insert(data.rows, line)
      local index = 1
      for value in iterator do
         if value == "1" then
            data.columns_one[index] = (data.columns_one[index] or 0) + 1
         end
         index = index + 1
      end
   end
end

local function gamma_epsilon(d)
   local gamma = ""
   local epsilon = ""
   -- determine gamma and epsilon
   for _, count in pairs(d.columns_one) do
      local add_one_to_gamma = count >= (#d.rows / 2)
      gamma = gamma .. (add_one_to_gamma and "1" or "0")
      epsilon = epsilon .. (add_one_to_gamma and "0" or "1")
   end
   return gamma, epsilon
end

local gamma, epsilon = gamma_epsilon(data)

print("Answer: " .. binary(gamma) * binary(epsilon))
