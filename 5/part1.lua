local function create_point(x, y)
   return {
      x = x,
      y = y,
      counter = 1,
      id = x .. "," .. y,
   }
end

local function line_iterator(x1, y1, x2, y2)
   local x_direction = 0
   local y_direction = 0
   local increment = -1

   if x1 == x2 and y1 > y2 then
      y_direction = -1
   elseif x1 == x2 and y1 < y2 then
      y_direction = 1
   elseif y1 == y2 and x1 > x2 then
      x_direction = -1
   elseif y1 == y2 and x1 < x2 then
      x_direction = 1
   else
      if x1 > x2 then
         x_direction = -1
      else
         x_direction = 1
      end

      if y1 > y2 then
         y_direction = -1
      else
         y_direction = 1
      end
   end

   return function()
      if x_direction == 0 and y_direction == 0 then
         return nil
      else
         increment = increment + 1
         local new_x = x1 + (x_direction * increment)
         local new_y = y1 + (y_direction * increment)
         if new_x == x2 and new_y == y2 then
            x_direction = 0
            y_direction = 0
         end
         return create_point(new_x, new_y)
      end
   end
end

local function input_for(file)
   local input = {}
   for line in io.lines(file) do
      local _, _, x1, y1, x2, y2 = line:find("(%d+),(%d+)....(%d+),(%d+)")
      if x1 and y1 and x2 and y2 then
         for point in line_iterator(tonumber(x1), tonumber(y1), tonumber(x2), tonumber(y2)) do
            print(point.id)
            local existing_point = input[point.id]
            if existing_point then
               existing_point.counter = existing_point.counter + 1
            else
               input[point.id] = point
            end
         end
      else
         print("Skipped line: " .. line)
      end
   end

   return input
end

local input_file = arg[1]
if not input_file then
   print("<input_file> required")
   return 1
end

local input = input_for(input_file)
local count = 0
for _, v in pairs(input) do
   if v.counter > 1 then
      count = count + 1
   end
end
print(count)
