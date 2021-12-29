local file = assert(io.open('./input.txt', 'r'))
local content = file:read("*all")
file:close()

local data = {}
for i in string.gmatch(content, '%S+') do
    table.insert(data, tonumber(i))
end

local sums = {}
for count=3,#data,1 do
        local currentSum = data[count] + data[count-1] + data[count-2]
        table.insert(sums, currentSum)
end

local result = 0
for count=2,#sums,1 do
        if sums[count] > sums[count-1] then
                result = result + 1
        end
end

print(result)
