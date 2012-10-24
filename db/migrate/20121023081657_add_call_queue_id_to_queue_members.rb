class AddCallQueueIdToQueueMembers < ActiveRecord::Migration
  def change
    add_column :queue_members, :call_queue_id, :integer
  end
end
