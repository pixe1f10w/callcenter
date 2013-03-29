class WorkplaceAssociation < Association
  many_to_one :workplace
  set_allowed_columns :workplace_id, :description, :route_id, :recorded, :active

  def validate
    super
    validates_presence :workplace_id
  end
end
