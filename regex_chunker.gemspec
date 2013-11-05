Gem::Specification.new do |gem|
  gem.authors       = ["Tom Cartwright"]
  gem.email         = ["tecartwright@gmail.com"]
  gem.summary         = %q{Matches enumerable-like object of tokens with a regex}
  gem.description     = %q{Uses string regexs array-to-string conversion to match a regex pattern across the array.}
  gem.homepage        = "https://github.com/tomcartwrightuk/regex_chunker"
  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(%r{^(specs)/})
  gem.name          = "regex_chunker"
  gem.require_paths = ["lib"]
  gem.version       = 0.1
end
