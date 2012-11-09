require File.dirname(__FILE__) + '/../spec_helper'

describe Call do
  it "should be valid" do
    Call.new.should be_valid
  end
end
# == Schema Information
#
# Table name: calls
#
#  uniqueid    :string(36)      not null, primary key
#  from        :string(255)
#  to          :string(255)
#  inbound     :boolean(1)
#  joined_at   :datetime
#  unjoined_at :datetime
#  answered_at :datetime
#  ended_at    :datetime
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

