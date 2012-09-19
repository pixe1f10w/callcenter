class Extension < ActiveRecord::Base
  attr_accessible :app, :appdata, :context, :exten, :priority
end
