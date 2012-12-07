require 'test_helper'

class QueueMemberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
# == Schema Information
#
# Table name: queue_members
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
#  line_id    :integer
#

