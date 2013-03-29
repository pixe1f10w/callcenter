Sequel.migration do
  up do
    alter_table :calls do
      drop_column :inbound
    end
  end

  down do
    alter_table :calls do
      add_column :inbound, Boolean
    end
  end
end
