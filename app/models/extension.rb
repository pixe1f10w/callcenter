class Extension < ActiveRecord::Base
  attr_accessible :app, :appdata, :context, :exten, :priority
  validates :context, presence: true
  validates :exten, presence: true
  validates :priority, presence: true
  validates :app, presence: true
  validates :appdata, presence: true
end

# == Schema Information
#
# Table name: extensions
#
#  id         :integer(4)      not null, primary key
#  context    :string(20)      not null
#  exten      :string(20)      not null
#  priority   :integer(4)      default(0)
#  app        :string(20)      not null
#  appdata    :string(128)     not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

