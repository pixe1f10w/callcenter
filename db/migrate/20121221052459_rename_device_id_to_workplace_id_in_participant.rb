Sequel.migration do
  up do
    alter_table :participants do
      rename_column :device_id, :workplace_id
    end
  end

  down do
    alter_table :participants do
      rename_column :workplace_id, :device_id
    end
  end
end
