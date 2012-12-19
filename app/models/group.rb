class Group < Sequel::Model
  plugin :association_proxies
  plugin :association_dependencies
  plugin :validation_helpers
  plugin :timestamps

  set_allowed_columns :announce, :announce_frequency, :announce_holdtime, :announce_round_seconds, :eventmemberstatus, :eventwhencalled, :joinempty, :leavewhenempty, :maxlen, :memberdelay, :monitor_format, :monitor_join, :musiconhold, :name, :queue_callswaiting, :queue_holdtime, :queue_lessthan, :queue_minutes, :queue_reporthold, :queue_seconds, :queue_thankyou, :queue_thereare, :queue_youarenext, :reportholdtime, :retry, :servicelevel, :strategy, :timeout, :timeoutrestart, :weight, :wrapuptime

  #has_many :participants, dependent: :destroy
  #has_many :devices, through: :participants
  one_to_many :participants
  many_to_many :devices, join_table: :participants
  add_association_dependencies devices: :nullify#, participants: :destroy

  def validate
    super
    validates_presence :name
    validates_unique :name #{ case_sensitive: false }
  end

  def to_i
    @id
  end
end
