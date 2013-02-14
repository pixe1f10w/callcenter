Sequel.migration do
  change do
    alter_table :devices do
      add_column :intercom_reachable, TrueClass, default: false, null: false
    end
  end
end
