class Gateway < Device
  one_to_many :inbound_routes
  #one_to_many :outbound_routes
  one_to_one :outbound_route
end
