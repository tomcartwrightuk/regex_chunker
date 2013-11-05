require 'regex_validator'
class RegexChunker

  # Takes a regex and an enumerable-like object of tokens that respond to .tag
  # To match a pattern of tags, pass in regexes in the form {TAG}. All the usual regex modifiers are accepted
  # For example: /({JJ})*({NN})/ matches any number of adjectives folowed by a noun
  # TODO Annotate the tokens object with the patterns

  attr_reader :regex, :tag_positions, :tokens, :regex_validator

  def initialize(regex, options = {})
    @regex_validator = options.fetch(:regex_validator) { RegexValidator.new }
    @regex = regex_validator.validate(regex)
  end

  def parse(tokens)
    @tokens = tokens
    s = join_words(tokens)
    tag_pos = get_tag_positions(s)
    match_patterns(s, tag_pos) 
  end

  private

  def join_words(tokens)
    tokens.map { |token| "{#{token.tag}}" }.join
  end

  def pattern_positions(s)
    positions = s.enum_for(:scan, regex).map do
      [
        $~.begin(0),
        $~[0].scan(/({\w*})/).length,
      ]
    end
  end

  def get_tag_positions(s)
    @tag_positions = s.enum_for(:scan, /({\w*})/).map { Regexp.last_match.begin(0) }
  end

  def match_patterns(str, tag_pos, matched_patterns = [])
    pattern_positions(str).each do |pos|
      idx = tag_pos.index(pos[0])
      matched_patterns << tokens[idx..idx+pos[1]-1]
    end
    matched_patterns
  end

end
