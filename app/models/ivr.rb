class Ivr < Sequel::Model
  plugin :association_proxies
  plugin :association_dependencies
  plugin :validation_helpers

  set_allowed_columns :name, :code

  one_to_many :ivr_associations, key: :ivr_id
  many_to_many :routes, join_table: :associations

  def validate
    super
    validates_presence :name
    validates_unique :name#{ case_sensitive: false }
  end

  def inbound_associations
    #ga = ivr_associations.map { |a| a unless a.inbound_route.nil? }
    #ga.compact
    #ivr_associations.inner_join( InboundRoute.dataset, id: :route_id ).all
    ivr_associations.where( inbound_route: InboundRoute.all ).all
  end

  def inbound_association id
    ivr_associations.where( inbound_route: InboundRoute.all ).where( id: id ).first
  end

=begin
  def inbound_associations_dataset
    ivr_associations.where( inbound_route: InboundRoute.all )
  end
=end

  def outbound_association
    #ga = ivr_associations.map { |a| a unless a.outbound_route.nil? }
    #ga.compact!.first unless ga.nil?
    #ivr_associations.inner_join( OutboundRoute.dataset, id: :route_id ).first
    ivr_associations.where( outbound_route: OutboundRoute.all ).first
  end
end
