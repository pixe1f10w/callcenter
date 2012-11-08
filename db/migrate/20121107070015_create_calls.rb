class CreateCalls < ActiveRecord::Migration
  def self.up
    create_table :calls, force: true, id: false do |t|
      t.column :uniqueid, 'varchar(36) primary key not null'
      t.string :from
      t.string :to
      t.time :duration
      t.boolean :inbound
      t.datetime :joined_at
      t.datetime :unjoined_at
      t.datetime :answered_at
      t.datetime :ended_at
      t.timestamps
    end
  end

  def self.down
    drop_table :calls
  end
end
