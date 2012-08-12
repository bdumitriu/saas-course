class Class

  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s
    attr_reader attr_name
    attr_reader attr_name + "_history"
    class_eval %Q{
      def #{attr_name}=(value)
        @#{attr_name} = value
        if (@#{attr_name}_history == nil)
          @#{attr_name}_history = [nil]
        end
        @#{attr_name}_history = @#{attr_name}_history + [value]
      end
    }
  end

end

class CurrencyUtils

  @@currencies = {'dollar' => 1.0, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}

  def self.get_currencies()
    return @@currencies
  end

end

class Numeric

  def method_missing(method_id)
    singular_currency = get_singular(method_id)
    currencies = CurrencyUtils.get_currencies()
    if currencies.has_key?(singular_currency)
      self * currencies[singular_currency]
    else
      super
    end
  end

  def get_singular(string)
    string.to_s.gsub(/s$/, '')
  end

end

class Float

  def in(currency)
    currencies = CurrencyUtils.get_currencies()
    singular_currency = get_singular(currency)
    if currencies.has_key?(singular_currency)
      self / currencies[singular_currency]
    else
      super
    end
  end

end

class String

  def palindrome?()
    string = self.downcase
    string = string.gsub(/\W/, "")
    return string == string.reverse
  end

  def count_words(string)
    string = string.downcase
    hash = Hash.new
    string.scan(/\b(\w+)\b/) { |word| hash[word[0]] = hash[word[0]].nil? ? 1 : hash[word[0]] + 1 }
    return hash
  end

end

module Enumerable

  def palindrome?()
    return self.map { |x| x } == self.reverse_each.map { |x| x }
  end

end
