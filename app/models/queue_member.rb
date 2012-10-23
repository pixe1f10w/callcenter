class QueueMember < ActiveRecord::Base
  before_create :set_queue_name, :set_interface

  attr_accessible :interface, :membername, :paused, :penalty, :queue_name, :device_id, :call_queue_id
  set_primary_key :uniqueid

  validates :membername, presence: true#, uniqueness: { case_sensitive: false }
  validates :device_id, presence: true
  validates :call_queue_id, presence: true
  #validates :interface, presence: true, uniqueness: { case_sensitive: false }
  #validates :queue_name, presence: true

  belongs_to :call_queue
  belongs_to :device

  private
    def set_queue_name
      call_queue = CallQueue.find self.call_queue_id
      call_queue_name = call_queue.nil? ? 0 : call_queue.name
      self.queue_name = call_queue_name
    end

    def set_interface
      device = Device.find self.device_id
      member_interface = device.nil? ? 0 : "SIP/#{device.name}"
      self.interface = member_interface
    end
end

# == Schema Information
#
# Table name: queue_members
#
#  uniqueid      :integer(4)      not null, primary key
#  membername    :string(40)
#  queue_name    :string(128)
#  interface     :string(128)
#  penalty       :integer(4)
#  paused        :integer(4)
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#  device_id     :integer(4)
#  call_queue_id :integer(4)
#

