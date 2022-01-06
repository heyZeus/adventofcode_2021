
print("Day 1:1")
print("")

local data = {
   lines = {},
   result = 0
}

for line in io.lines('./input.txt') do
   local num = tonumber(line)
   if num then
      table.insert(data.lines, num)
   end
end

for count=2, #data.lines, 1 do
   if data.lines[count] >= data.lines[count-1] then
      data.result = data.result + 1
   end
end

print(data.result)
