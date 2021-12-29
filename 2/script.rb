
answer = File.readlines('input.txt')
  .inject({depth: 0, horizontal: 0, aim: 0}) do |memo, line|
    direction, unit = line.split(" ")[0..1]
    unit = unit.to_i

    case direction
    when "up"
      # memo[:depth] -= unit
      memo[:aim] -= unit
    when "down"
      # memo[:depth] += unit
      memo[:aim] += unit
    when "forward"
      memo[:horizontal] += unit
      memo[:depth] += memo[:aim] * unit
    end
    memo
  end
  .fetch_values(:depth, :horizontal)
  .inject(:*)

puts answer
