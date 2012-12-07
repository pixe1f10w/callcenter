class AddDeviceIdToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :device_id, :integer
  end
end
