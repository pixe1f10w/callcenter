require 'test_helper'

class CallQueueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
# == Schema Information
#
# Table name: call_queues
#
#  id                     :integer(4)      not null, primary key
#  name                   :string(128)
#  musiconhold            :string(128)
#  announce               :string(128)
#  timeout                :integer(4)
#  monitor_join           :boolean(1)
#  monitor_format         :string(128)
#  queue_youarenext       :string(128)
#  queue_thereare         :string(128)
#  queue_callswaiting     :string(128)
#  queue_holdtime         :string(128)
#  queue_minutes          :string(128)
#  queue_seconds          :string(128)
#  queue_lessthan         :string(128)
#  queue_thankyou         :string(128)
#  queue_reporthold       :string(128)
#  announce_frequency     :integer(4)
#  announce_round_seconds :integer(4)
#  announce_holdtime      :string(128)
#  retry                  :integer(4)
#  wrapuptime             :integer(4)
#  maxlen                 :integer(4)
#  servicelevel           :integer(4)
#  strategy               :string(128)
#  joinempty              :string(128)
#  leavewhenempty         :string(128)
#  eventmemberstatus      :boolean(1)
#  eventwhencalled        :boolean(1)
#  reportholdtime         :boolean(1)
#  memberdelay            :integer(4)
#  weight                 :integer(4)
#  timeoutrestart         :boolean(1)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#

