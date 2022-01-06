local function file_exists(file)
    local f = io.open(file, "rb")
    if f then f:close() end
    return f ~= nil
end

local function lines_from(file)
    if not file_exists(file) then return {} end
    local lines = {}
    for line in io.lines(file) do
      local iterator = line:gmatch("(%d)") -- remove invalid lines
      if iterator then
         table.insert(lines, line)
      end
    end
    return lines
end

-- Part 2
local function calc_rating(rows, use_majority)
    local i = 1
    while #rows > 1 do
        local ones = {}
        local zeros = {}

        for _, binary in pairs(rows) do
            local bit = binary:sub(i,i)
            local add_to_table = bit == '1' and ones or zeros
            table.insert(add_to_table, binary)
        end

        if use_majority then
            rows = #ones >= #zeros and ones or zeros
        else
            rows = #ones >= #zeros and zeros or ones
        end

        i = i + 1
    end
    return rows[1]
end

local instructions = lines_from('input.txt')
local c02 = calc_rating(instructions, false)
local oxygen = calc_rating(instructions, true)

local part_2_solution = tonumber(oxygen, 2) * tonumber(c02, 2)
print("Solution: " .. part_2_solution)
