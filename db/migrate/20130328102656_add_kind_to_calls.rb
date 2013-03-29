Sequel.migration do
  change do
    alter_table :calls do
      add_column :kind, String
    end
  end
end
