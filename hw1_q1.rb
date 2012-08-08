def palindrome?(string)
  string = string.downcase
  string = string.gsub(/\W/, "")
  return string == string.reverse
end

def count_words(string)
  string = string.downcase
  hash = Hash.new
  string.scan(/\b(\w+)\b/) {|word| hash[word[0]] = hash[word[0]].nil? ? 1 : hash[word[0]] + 1 }
  return hash
end
