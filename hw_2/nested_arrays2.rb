numbers = [
  [1, 2, 3],
  [2, 2, 2],
  [3, 2, 1]
]

lines = []

numbers.map do |numbers_array|
  line = ""
  numbers_array.each do |number|
    line << " " if line != ""
    number.times{line << "*"}
  end
  lines << line
end

lines.each {|line| puts line }