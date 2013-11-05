require 'spec_helper'

describe RegexChunker do

  describe "parse" do

    let(:tokens) {
      TokenDouble.new.tokens
    }

    it "should return an enumerable of matching phrases" do
      reg_parser = RegexChunker.new(/({JJ})+({NN})/)
      parsed_tokens = reg_parser.parse(tokens)
      parsed_tokens.should eq(
        [
          [OpenStruct.new(:string => "small", :tag => "JJ"),
           OpenStruct.new(:string => "ant", :tag => "NN")],
          [OpenStruct.new(:string => "sunny", :tag => "JJ"),
           OpenStruct.new(:string => "day", :tag => "NN")]
        ]
      )
    end
    
    it "should return an enumerable of matching phrases when given a operators" do
      reg_parser = RegexChunker.new(/({JJ}|{VBG}){NN}/)
      parsed_tokens = reg_parser.parse(tokens)
      parsed_tokens.should eq(
        [
          [OpenStruct.new(:string => "small", :tag => "JJ"), 
           OpenStruct.new(:string => "ant", :tag => "NN")],
          [OpenStruct.new(:string => "magnifying", :tag => "VBG"), 
           OpenStruct.new(:string => "glass", :tag => "NN")],
          [OpenStruct.new(:string => "sunny", :tag => "JJ"), 
           OpenStruct.new(:string => "day", :tag => "NN")]
        ]
      )
    end
  end
  
end
