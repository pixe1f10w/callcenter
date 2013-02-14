class Workplace < Device
  #set_allowed_columns allowed_columns.push :intercom_reachable

  one_to_many :participant
  add_association_dependencies participant: :destroy

  one_to_many :workplace_associations, key: :workplace_id
  many_to_many :routes, join_table: :associations
end
