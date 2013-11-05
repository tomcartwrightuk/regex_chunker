regex_chunker
=============

A sort of ruby version of the RegexParser module in the NLTK

Takes a regex and an enumerable-like object of tokens that respond to .tag.
To match a pattern of tags, pass in regexes in the form {TAG}. All the usual regex modifiers are accepted.

Useage

To abtain an enumerable of tokens tagged with Parts of Speech (POS) use treat (https://github.com/louismullie/treat).
```
reg_chunker = RegexChunker.new(/({JJ})*({NN})/)
matching_chunks = reg_chunker.parse(tagged_tokens)
```

