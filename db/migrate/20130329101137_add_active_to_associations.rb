Sequel.migration do
  change do
    alter_table :associations do
      add_column :active, TrueClass, default: true
    end
  end
end
