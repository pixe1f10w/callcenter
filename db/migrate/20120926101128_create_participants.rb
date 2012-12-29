Sequel.migration do
  change do

    #create_table :participants do#, force: true, id: false do |t|
    create_table :participants, engine: 'InnoDB' do
      #Integer :uniqueid, unsigned: true, limit: 10, options: 'primary key not null auto_increment'
      #t.column :uniqueid, 'int(10) unsigned primary key not null auto_increment'
      primary_key :uniqueid, limit: 10
      foreign_key :workplace_id, :devices
      foreign_key :group_id, :groups

      #t.column :uniqueid, 'serial primary key not null'
      String :membername, limit: 40
      String :queue_name, limit: 128
      String :interface, limit: 128
      Integer :penalty, limit: 11
      Integer :paused, limit: 11

      DateTime :created_at
      DateTime :updated_at
    end

  end
end
