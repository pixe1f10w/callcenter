class IvrAssociation < Association
  many_to_one :ivr
  set_allowed_columns :ivr_id, :description, :route_id, :recorded, :active

  def validate
    super
    validates_presence :ivr_id
  end
end
