class OutboundRoute < Route
  #one_to_one :group
  many_to_one :group # TODO: it's a temporal solution, must be one-to-one
end
