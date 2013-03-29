class GroupAssociation < Association
  many_to_one :group
  set_allowed_columns :group_id, :description, :route_id, :recorded, :active

  def validate
    super
    validates_presence :group_id
  end
end
