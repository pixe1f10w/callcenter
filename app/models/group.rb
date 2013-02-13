class Group < Sequel::Model
  plugin :association_proxies
  plugin :association_dependencies
  plugin :validation_helpers
  plugin :timestamps

  set_allowed_columns :announce, :announce_frequency, :announce_holdtime, :announce_round_seconds, :eventmemberstatus, :eventwhencalled, :joinempty, :leavewhenempty, :maxlen, :memberdelay, :monitor_format, :monitor_join, :musiconhold, :name, :queue_callswaiting, :queue_holdtime, :queue_lessthan, :queue_minutes, :queue_reporthold, :queue_seconds, :queue_thankyou, :queue_thereare, :queue_youarenext, :reportholdtime, :retry, :servicelevel, :strategy, :timeout, :timeoutrestart, :weight, :wrapuptime

  one_to_many :participants
  many_to_many :workplaces, join_table: :participants
  add_association_dependencies workplaces: :nullify#, participants: :destroy

  one_to_many :group_associations, key: :group_id
  many_to_many :routes, join_table: :associations
  add_association_dependencies routes: :nullify

  def validate
    #TODO: complicated validations
    super
    validates_presence :name
    validates_unique :name #{ case_sensitive: false }
  end

=begin
  class DatasetProxy
    instance_methods.each { |m| undef_method m unless m =~ /(^__|^send$|^object_id$)/ }
    include Sequel::Dataset

    protected
    def method_missing( name, *args, &block )
      target.send( name, *args, &block )
    end

    def target
      @target ||= self.all
    end
  end
=end

  def inbound_associations
    #ga = group_associations.map { |a| a unless a.inbound_route.nil? }
    #ga.compact
    #group_associations.inner_join( InboundRoute.dataset, id: :route_id ).all
    group_associations.where( inbound_route: InboundRoute.all ).all
  end

  def inbound_association id
    group_associations.where( inbound_route: InboundRoute.all ).where( id: id ).first
  end

=begin
  def inbound_associations_dataset
    group_associations.where( inbound_route: InboundRoute.all )
  end
=end

  def outbound_association
    #ga = group_associations.map { |a| a unless a.outbound_route.nil? }
    #ga.compact!.first unless ga.nil?
    #group_associations.inner_join( OutboundRoute.dataset, id: :route_id ).first
    group_associations.where( outbound_route: OutboundRoute.all ).first
  end
end
