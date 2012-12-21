class Workplace < Device
  one_to_many :participant
  add_association_dependencies participant: :destroy
end
