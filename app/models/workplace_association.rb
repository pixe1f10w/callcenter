class WorkplaceAssociation < Association
  #one_to_one :workplace, key: :id
  many_to_one :workplace

  def validate
    super
    validates_presence :workplace_id
  end
end
