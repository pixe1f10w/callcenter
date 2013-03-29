class Gateway < Device
  one_to_many :inbound_routes
  one_to_many :outbound_routes
  add_association_dependencies inbound_routes: :destroy
  add_association_dependencies outbound_routes: :destroy
end
