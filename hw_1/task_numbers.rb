numbers = [1025312547, 8795646456, 1232785215, 4694157532, 8578789565, 2541365861, 4455758845, 1919643419, 7424653654]
max_hash = []
numbers.each { |number| max_hash.push(number => number.digits.max) }
print max_hash
puts

string_array = []
numbers.each { |number| string_array.push(number.digits.max, number.digits.min) }
print string_array.join("")
puts

max_1 = numbers.max
min_1 = numbers.min
numbers.delete(max_1)
numbers.delete(min_1)
max_2 = numbers.max
min_2 = numbers.min
sum_array = max_1+min_1+max_2+min_2
print sum_array
puts