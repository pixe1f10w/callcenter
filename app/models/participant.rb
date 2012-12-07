class Participant < ActiveRecord::Base
  before_create :set_queue_name, :set_interface

  attr_accessible :interface, :membername, :paused, :penalty, :queue_name, :device_id, :group_id
  set_primary_key :uniqueid

  validates :membername, presence: true#, uniqueness: { case_sensitive: false }
  validates :device_id, presence: true
  validates :group_id, presence: true
  validates_uniqueness_of :device_id, scope: :group_id
  #validates :interface, presence: true, uniqueness: { case_sensitive: false }
  #validates :queue_name, presence: true

  belongs_to :group
  belongs_to :device

  def to_i
    @id
  end

  private
    def set_queue_name
      group = Group.find self.group_id
      group_name = group.nil? ? 0 : group.name
      self.queue_name = group_name
    end

    def set_interface
      device = Device.find self.device_id
      member_interface = device.nil? ? 0 : "SIP/#{device.name}"
      self.interface = member_interface
    end
end

# == Schema Information
#
# Table name: participants
#
#  uniqueid   :integer         not null, primary key
#  membername :string(40)
#  queue_name :string(128)
#  interface  :string(128)
#  penalty    :integer
#  paused     :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  device_id  :integer
#  group_id   :integer
#

