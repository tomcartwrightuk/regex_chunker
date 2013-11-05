require 'spec_helper'

describe RegexValidator do

  describe "validate" do

    it "should return the regex if it in the {TAG} pattern" do
      expect { RegexValidator.new.validate(/({NN})*({DT})/) }.to_not raise_error
      expect { RegexValidator.new.validate(/({NN})*({DT|IN})+/) }.to_not raise_error
    end

    it "should raise a InvalidRegexError when given an invalid regex parser pattenr" do
      expect { RegexValidator.new.validate(/(NN})*/) }.to raise_error(InvalidRegexError)
      expect { RegexValidator.new.validate(/({N})/) }.to raise_error(InvalidRegexError)
      expect { RegexValidator.new.validate(/({N})*({NNP)/) }.to raise_error(InvalidRegexError)
    end

  end

end
