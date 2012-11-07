class Call < ActiveRecord::Base
  attr_accessible :uniqueid, :ended_at, :answered_at, :joined_at, :from, :to, :duration, :inbound
  set_primary_key :uniqueid
end
