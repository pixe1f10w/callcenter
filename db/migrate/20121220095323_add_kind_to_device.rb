Sequel.migration do
  change do
    alter_table :devices do
      #add_column :kind, Integer, null: false
      add_column :kind, String, null: false
      add_index :kind
    end
  end
end
