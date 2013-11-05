class TokenDouble

  def tokens
    [["When", "DT"], ["you", "PRP"], ["look", "VRB"], ["at", "IN"], ["a", "DT"], ["small", "JJ"], ["ant", "NN"], ["through", "IN"], ["a", "DT"], ["magnifying", "VBG"], ["glass", "NN"], ["on", "IN"], ["a", "DT"], ["sunny", "JJ"], ["day", "NN"]].map do |e|
      OpenStruct.new(:string => e[0], :tag => e[1])
    end
  end

end
