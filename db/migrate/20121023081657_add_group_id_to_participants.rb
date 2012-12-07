class AddGroupIdToParticipants < ActiveRecord::Migration
  def change
    add_column :participants, :group_id, :integer
  end
end
