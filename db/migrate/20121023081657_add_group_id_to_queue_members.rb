class AddGroupIdToQueueMembers < ActiveRecord::Migration
  def change
    add_column :queue_members, :group_id, :integer
  end
end
