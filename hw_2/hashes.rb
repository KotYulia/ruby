languages = {
  de: 'German',
  en: 'English',
  es: 'Spanish'
}

dictionary = {
  de: {one: 'eins', two: 'zwei', three: 'drei'},
  en: {one: 'one', two: 'two', three: 'three'},
  es: {one: 'uno', two: 'dos', three: 'tres'}
}

#Text
key_array = dictionary.keys
english_hash = dictionary[:en]
result_str = "In "

key_array.each do |lang_key|
  if lang_key != :en
    result_str << languages[lang_key]
    words_hash = dictionary[lang_key]
    words_hash.each do |word_key, word|
      result_str << " #{word} means #{english_hash[word_key]},"
    end

    puts result_str.gsub(/\,$/, '.')
    result_str = "In "
  end
end


# Table
words_keys = dictionary[:en].keys
dictionary_hash_arr = dictionary.values

dictionary.each do |language, dictionary_words|
  row = "| #{language} "
  words_keys.each do |key|
    words_values_arr = []
    dictionary_hash_arr.each do |words_hash|
      word = words_hash[key]
      words_values_arr << word
    end

    longest_word = words_values_arr.max_by(&:length)
    longest_word_length = longest_word.length

    row << "| #{dictionary_words[key]} "

    difference = longest_word_length - dictionary_words[key].length
    difference.times{row << " "}
  end

  puts "#{row} |"
end