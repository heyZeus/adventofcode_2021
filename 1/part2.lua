local data = {
    lines = {},
    sums = {},
    result = 0
}

for line in io.lines('./input.txt') do
    num = tonumber(line)
    if num then
        table.insert(data.lines, num)
    end
end

for count=3, #data.lines, 1 do
    local sum = data.lines[count] + data.lines[count - 1] + data.lines[count - 2]
    table.insert(data.sums, sum)
end

for count=2, #data.sums, 1 do
    if data.sums[count] > data.sums[count - 1] then
        data.result = data.result + 1
    end
end

print(data.result)
