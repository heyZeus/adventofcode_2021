
print("Day 1")

local data = {
  lines = {},
  result = 0
}

for line in io.lines('./input.txt') do
    num = tonumber(line)
    if num then
        table.insert(data.lines, num)
    end
end

local result = 0
for count=2, #data.lines, 1 do
    if data.lines[count] >= data.lines[count-1] then
        data.result = data.result + 1
    end
end

print(data.result)
