def palindrome?(string)
  string = string.downcase
  string = string.gsub(/\W/, "")
  return string == string.reverse
end
