Sequel.migration do
  change do
    alter_table :devices do
      add_column :kind, Integer
    end
  end
end
