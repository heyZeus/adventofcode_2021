local function make_point(x, y)
   tonumber(string.format("%s.%s", x, y))
end

local function line_iterator(x1, y1, x2, y2)
   local stop = 0
   local a = 0
   local b = 0
   local increment_a = false
   local increment_b = false

   if x1 == x2 then
      if y1 > y2 then
         a = y2
         b = y1
         incrementee_a = true
         stop = b
      else
         a = y1
         b = y2
         incrementee_a = false
         stop = a
      end
   end

   return function()
      if increment_a then
         a = a + 1
      else
         b = b + 1
      end

      if a > stop_a or b > stop_b then
         return nil
      else
         return a .. "," .. b
      end
   end
end

local function input_for(file)
   local input = {}
   for line in io.lines(file) do
      local _, _, x1, y1, x2, y2 = line:find("(%d+),(%d+)....(%d+),(%d+)")
      if x1 and y1 and x2 and y2 then
         for point in line_iterator(tonumber(x1), tonumber(y1), tonumber(x2), tonumber(y2)) do
            input[point] = (input[point] or 0) + 1
         end
      end
   end
   return input
end

local input = input_for("./simple_input.txt")

for k, v in pairs(input) do
   print(k, v)
end
