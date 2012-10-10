class CreateQueueMembers < ActiveRecord::Migration
  def change
    create_table :queue_members, force: true, id: false do |t|
      t.integer :uniqueid, unsigned: true, limit: 10
      t.string :membername, limit: 40
      t.string :queue_name, limit: 128
      t.string :interface, limit: 128
      t.integer :penalty, limit: 11
      t.integer :paused, limit: 11

      t.timestamps
    end

    #add_index :queue_members, :uniqueid, unique: true
    execute 'alter table queue_members add primary key ( uniqueid )'
  end
end
