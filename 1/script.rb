
puts File.readlines('input.txt')
  .map(&:to_i)
  .each_cons(2)
  .select { |a, b| b > a }
  .count

puts File.readlines('input.txt')
  .map(&:to_i)
  .each_cons(3)
  .map(&:sum)
  .each_cons(2)
  .select { |a, b| b > a }
  .count
