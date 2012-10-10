class QueueMember < ActiveRecord::Base
  attr_accessible :interface, :membername, :paused, :penalty, :queue_name
  set_primary_key :uniqueid
  validates :membername, presence: true, uniqueness: { case_sensitive: false }
  validates :interface, presence: true, uniqueness: { case_sensitive: false }
  validates :queue_name, presence: true
end
