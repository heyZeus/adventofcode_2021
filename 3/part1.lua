
print("Day 3")
print("")

local data = {
    columns = {},
    total_rows = 0,
    gamma = "",
    epsilon = ""
}

function binary(data, name)
    return tonumber(data[name], 2)
end

function tostring(data)
    local format = "Gamma: %s - %s\nEpsilon: %s - %s"
    return string.format(format, data.gamma, binary(data, 'gamma'), data.epsilon, binary(data, 'epsilon'))
end

for line in io.lines('./input.txt') do
    data.total_rows = data.total_rows + 1
    index = 1
    for value in line:gmatch("(%d)") do
        if data.columns[index] == nil then
            table.insert(data.columns, index, 0)
        end
        if value == "1" then
            data.columns[index] = data.columns[index] + 1
        end
        index = index + 1
    end
end

for _, count in pairs(data.columns) do
    local add_one_to_gamma = count >= data.total_rows / 2
    data.gamma = data.gamma .. ((add_one_to_gamma) and "1" or "0")
    data.epsilon = data.epsilon .. ((add_one_to_gamma) and "0" or "1")
end

print(tostring(data))
print("Answer: " .. binary(data, 'gamma') * binary(data, 'epsilon'))
