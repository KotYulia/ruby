names = ["Mr. Nil Wilson", "Charlz Smith", "Jon Williams Jr.", "Mrs. Ann Parker", "Suzanna Nikolson", "Dr. Jacob Lewis", "Mrs. Kate Rodriges", "Margo Young", "Anita Robinson", "Bob Thompson Jr.", "Mary Shelly", "Dr. Patrik Campbell"]
full_names = names.map {|name| name.gsub("Mr. ", "").gsub("Mrs. ", "").gsub("Dr. ", "").gsub(" Jr.", "")}
print full_names
puts

hash_names = Hash[full_names.map {|name| name.split(" ")}]
print hash_names
puts

key_array = []
hash_letters = hash_names.map do |key, value|
  x = key[0]
  y = value[1]
  if key_array.include?(x)
    [x+key[1], y]
  else
    key_array.push(x)
    [x, y]
  end
end
print Hash[hash_letters]
puts

letters_array = []
hash_names.each do |key, value|
  x = key[0]
  y = value[0]
  letters_array.push(x) unless letters_array.include?(x)
  letters_array.push(y) unless letters_array.include?(y)
end
print letters_array.sort
puts

reverse_array = []
hash_names.map { |key, value| reverse_array.push("#{value} #{key}") }
print reverse_array
puts