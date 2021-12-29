local data = {}
for line in io.lines('./input.txt') do
    table.insert(data, tonumber(line))
end

local result = 0
for count=2, #data, 1 do
    if data[count] >= data[count-1] then
        result = result + 1
    end
end

print(result)
