class Workplace < Device
  #set_allowed_columns allowed_columns.push :intercom_reachable

  one_to_many :participant
  add_association_dependencies participant: :destroy

  one_to_many :workplace_associations, key: :workplace_id
  many_to_many :routes, join_table: :associations

  def inbound_associations
    #ga = workplace_associations.map { |a| a unless a.inbound_route.nil? }
    #ga.compact
    #workplace_associations.inner_join( InboundRoute.dataset, id: :route_id ).all
    workplace_associations.where( inbound_route: InboundRoute.all ).all
  end

  def inbound_association id
    workplace_associations.where( inbound_route: InboundRoute.all ).where( id: id ).first
  end

=begin
  def inbound_associations_dataset
    workplace_associations.where( inbound_route: InboundRoute.all )
  end
=end

  def outbound_association
    #ga = workplace_associations.map { |a| a unless a.outbound_route.nil? }
    #ga.compact!.first unless ga.nil?
    #workplace_associations.inner_join( OutboundRoute.dataset, id: :route_id ).first
    workplace_associations.where( outbound_route: OutboundRoute.all ).first
  end
end
