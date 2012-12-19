class Call < Sequel::Model
  plugin :validation_helpers
  plugin :timestamps

  set_allowed_columns :uniqueid, :created_at, :ended_at, :answered_at,
                      :joined_at, :unjoined_at, :from, :to, :inbound
  set_primary_key :uniqueid

  VALID_UNIQUEID_REGEX = /^\w{8}-\w{4}-\w{4}-\w{4}-\w{12}$/
  SOURCE_REGEX = /^(?<name>\w*)\s<SIP\/(?<id>\w*)>$/

  def before_create
    update_source
    super
  end
  #before_save :calculate_duration

  def validate
    super
    validates_presence :uniqueid
    validates_unique :uniqueid
    #validates_format :uniqueid, with: VALID_UNIQUEID_REGEX
    validates_format VALID_UNIQUEID_REGEX, :uniqueid
  end

  def to_i
    @uniqueid
  end

  private
    def update_source
        id = self.from.match( SOURCE_REGEX )[ 'id' ]
        self.from = id unless id.nil?
    end
=begin
    def calculate_duration
      #if not ( self.answered_at.nil? && self.ended_at.nil? )
      begin
        self.duration = self.ended_at - self.answered_at
      rescue
      end
    end
=end
end
