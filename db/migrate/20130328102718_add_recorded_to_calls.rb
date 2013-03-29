Sequel.migration do
  change do
    alter_table :calls do
      add_column :recorded, TrueClass, default: false
    end
  end
end
