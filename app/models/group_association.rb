class GroupAssociation < Association
  many_to_one :group

  def validate
    super
    validates_presence :group_id
  end
end
