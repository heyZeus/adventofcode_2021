
# Assumes there will only be zeros and ones in the data
# Count up all of the zero's per column and divide by total rows
zero = "0"
one = "1"
all_lines = File.readlines('input.txt')
majority = all_lines.size / 2

gamma = all_lines
  .inject([]) do |memo, line|
    line.chomp.each_char.with_index do |char, column|
      memo[column] ||= 0
      memo[column] += 1 if char == zero
    end
    memo
  end
  .map { |zero_count| zero_count >= majority ? zero : one }
  .join

# if gamma is a zero, make epsilon a one
epsilon = gamma
  .each_char
  .map { |value| value == zero ? one : zero }
  .join

puts "#{gamma} == #{gamma.to_i(2)}"
puts "#{epsilon} ==  #{epsilon.to_i(2)}"

puts "Answer: #{gamma.to_i(2) * epsilon.to_i(2)}"
