Sequel.migration do
  change do
    alter_table :associations do
      add_column :recorded, TrueClass, default: false, null: false
    end
  end
end
