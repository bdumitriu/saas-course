def get_base_word(word)
  return word.downcase.chars.sort.join
end

def combine_anagrams(words)
  hash = Hash.new
  words.each do |word|
    base_word = get_base_word(word)
    hash[base_word] = [word] + (hash[base_word].nil? ? [] : hash[base_word])
  end
  return hash.values
end
