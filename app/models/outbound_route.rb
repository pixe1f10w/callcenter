class OutboundRoute < Route
  one_to_many :workplace_associations, key: :route_id
  one_to_many :group_associations, key: :route_id
end
