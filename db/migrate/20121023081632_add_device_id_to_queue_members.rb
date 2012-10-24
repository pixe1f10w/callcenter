class AddDeviceIdToQueueMembers < ActiveRecord::Migration
  def change
    add_column :queue_members, :device_id, :integer
  end
end
