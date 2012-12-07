class Call < ActiveRecord::Base
  attr_accessible :uniqueid, :created_at, :ended_at, :answered_at, :joined_at, :unjoined_at, :from, :to, :inbound
  set_primary_key :uniqueid
  before_create :update_source
  #before_save :calculate_duration

  #VALID_UNIQUEID_REGEX = /^\d{10}\.\d{3}$/
  SOURCE_REGEX = /^(?<name>\w*)\s<SIP\/(?<id>\w*)>$/
  VALID_UNIQUEID_REGEX = /^\w{8}-\w{4}-\w{4}-\w{4}-\w{12}$/
  validates :uniqueid, presence: true, format: { with: VALID_UNIQUEID_REGEX }

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
# == Schema Information
#
# Table name: calls
#
#  uniqueid    :string(36)      not null, primary key
#  from        :string(255)
#  to          :string(255)
#  inbound     :boolean
#  joined_at   :datetime
#  unjoined_at :datetime
#  answered_at :datetime
#  ended_at    :datetime
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

