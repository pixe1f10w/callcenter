class Participant < Sequel::Model
  #plugin :association_proxies
  #plugin :association_dependencies
  plugin :validation_helpers
  plugin :timestamps

  set_allowed_columns :interface, :membername, :paused, :penalty, :queue_name, :device_id, :group_id
  set_primary_key :uniqueid

  def before_create
    set_queue_name
    set_interface
    super
  end

  def validate
    super
    validates_presence :membername
    validates_presence :device_id
    validates_presence :group_id
    validates_unique [ :device_id, :group_id ]
    #validates :interface, presence: true, uniqueness: { case_sensitive: false }
    #validates :queue_name, presence: true
  end

  many_to_one :group
  many_to_one :device

  private
    def set_queue_name
      group = Group.find! self.group_id
      group_name = group.nil? ? 0 : group.name
      self.queue_name = group_name
    end

    def set_interface
      device = Device.find! self.device_id
      member_interface = device.nil? ? 0 : "SIP/#{device.name}"
      self.interface = member_interface
    end
end

