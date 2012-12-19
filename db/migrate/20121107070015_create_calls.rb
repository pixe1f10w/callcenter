Sequel.migration do
  up do

    create_table :calls do
      #t.column :uniqueid, 'varchar(36) primary key not null'
      String :uniqueid, primary_key: true, null: false

      String :from
      String :to
      Boolean :inbound
      DateTime :created_at
      DateTime :updated_at
      DateTime :joined_at
      DateTime :unjoined_at
      DateTime :answered_at
      DateTime :ended_at
    end

  end

  down do

    drop_table :calls

  end
end
