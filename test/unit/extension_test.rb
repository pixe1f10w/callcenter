require 'test_helper'

class ExtensionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
# == Schema Information
#
# Table name: extensions
#
#  id         :integer         not null, primary key
#  context    :string(20)      not null
#  exten      :string(20)      not null
#  priority   :integer         default(0)
#  app        :string(20)      not null
#  appdata    :string(128)     not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

