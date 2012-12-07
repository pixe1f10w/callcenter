class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants, force: true, id: false do |t|
      #t.integer :uniqueid, unsigned: true, limit: 10, options: 'primary key not null auto_increment'
      t.column :uniqueid, 'int(10) unsigned primary key not null auto_increment'
      #t.column :uniqueid, 'serial primary key not null'
      t.string :membername, limit: 40
      t.string :queue_name, limit: 128
      t.string :interface, limit: 128
      t.integer :penalty, limit: 11
      t.integer :paused, limit: 11

      t.timestamps
    end

    #add_index :queue_members, :uniqueid, unique: true
  end
end
