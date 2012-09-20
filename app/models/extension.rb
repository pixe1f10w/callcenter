class Extension < ActiveRecord::Base
  attr_accessible :app, :appdata, :context, :exten, :priority
  validates :context, presence: true
  validates :exten, presence: true
  validates :priority, presence: true
  validates :app, presence: true
  validates :appdata, presence: true
end
