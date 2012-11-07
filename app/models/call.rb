class Call < ActiveRecord::Base
  attr_accessible :uniqueid, :created_at, :ended_at, :answered_at, :joined_at, :from, :to, :duration, :inbound
  set_primary_key :uniqueid

  VALID_UNIQUEID_REGEX = /^\d{10}\.\d{3}$/
  validates :uniqueid, presence: true, format: { with: VALID_UNIQUEID_REGEX }
end
# == Schema Information
#
# Table name: calls
#
#  uniqueid    :string(20)      not null, primary key
#  from        :string(255)
#  to          :string(255)
#  duration    :time
#  inbound     :boolean(1)
#  joined_at   :datetime
#  answered_at :datetime
#  ended_at    :datetime
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

