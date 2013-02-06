class Group < Sequel::Model
  plugin :association_proxies
  plugin :association_dependencies
  plugin :validation_helpers
  plugin :timestamps

  set_allowed_columns :announce, :announce_frequency, :announce_holdtime, :announce_round_seconds, :eventmemberstatus, :eventwhencalled, :joinempty, :leavewhenempty, :maxlen, :memberdelay, :monitor_format, :monitor_join, :musiconhold, :name, :queue_callswaiting, :queue_holdtime, :queue_lessthan, :queue_minutes, :queue_reporthold, :queue_seconds, :queue_thankyou, :queue_thereare, :queue_youarenext, :reportholdtime, :retry, :servicelevel, :strategy, :timeout, :timeoutrestart, :weight, :wrapuptime

  one_to_many :participants
  many_to_many :workplaces, join_table: :participants
  add_association_dependencies workplaces: :nullify#, participants: :destroy
  many_to_many :routes, join_table: :associations
  one_to_many :group_associations, key: :group_id
  #TODO: dependencies

  def validate
    super
    validates_presence :name
    validates_unique :name #{ case_sensitive: false }
  end
end
