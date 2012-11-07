class Call < ActiveRecord::Base
  attr_accessible :uniqueid, :created_at, :ended_at, :answered_at, :joined_at, :from, :to, :duration, :inbound
  set_primary_key :uniqueid

  VALID_UNIQUEID_REGEX = /^\d{10}\.\d{3}$/
  validates :uniqueid, presence: true, format: { with: VALID_UNIQUEID_REGEX }
end
