class InboundRoute < Route
  one_to_one :workplace_association, key: :route_id
  one_to_one :group_association, key: :route_id
end
