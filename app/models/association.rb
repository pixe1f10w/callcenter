class Association < Sequel::Model
  plugin :validation_helpers
  plugin :nested_attributes
  plugin :timestamps
  plugin :single_table_inheritance, :kind,
        model_map: { 1 => :WorkplaceAssociation, 2 => :GroupAssociation }

  many_to_one :outbound_route, key: :route_id
  many_to_one :inbound_route, key: :route_id

  def before_create
    super
  end

  def validate
    super
    validates_presence :route_id
  end
end
