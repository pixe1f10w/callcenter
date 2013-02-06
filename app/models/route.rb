class Route < Sequel::Model
  plugin :validation_helpers
  plugin :timestamps
  plugin :single_table_inheritance, :kind,
        model_map: { 1 => :InboundRoute, 2 => :OutboundRoute }

  set_allowed_columns :sip_uri, :descr, :gateway_id
  many_to_one :gateway
  #TODO: better to do that as hooks in inbound and outbound separately
  many_to_many :groups, join_table: :associations
  many_to_many :workplaces, join_table: :associations

  def before_create
    super
  end

  def validate
    super
    validates_presence :sip_uri
    validates_unique [ :sip_uri, :kind ]
    validates_presence :gateway_id
  end
end
