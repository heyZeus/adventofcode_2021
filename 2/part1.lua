local pos = {
    horizontal = 0,
    depth = 0,
    aim = 0
}

print("Day 2:1")
print("")

for line in io.lines('./input.txt') do
   _, _, dir, num = line:find("(%a+) (%d+)")
   if dir == 'forward' then
       pos.horizontal = pos.horizontal + num
       pos.depth = pos.depth + (pos.aim * num)
   elseif dir == 'down' then
       pos.aim = pos.aim + num
   elseif dir == "up" then
       pos.aim = pos.aim - num
   end
end

print('Horizontal: '..pos.horizontal..'\n'..'Depth: '..pos.depth)
print(pos.depth * pos.horizontal)
