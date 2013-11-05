class RegexValidator

  def validate(regex)
    regex_str = regex.inspect
    matching_patterns = regex_str.scan(/(\{{1}(\w\w+\|?)*\}{1})+/)
    if matching_patterns.empty?
      raise InvalidRegexError, "Regexes must concist of {TAG} groups with standard regex modifiers"
    end
    regex
  end

end

class InvalidRegexError < StandardError
end
