Sequel.migration do
  change do

    create_table :ivrs, engine: 'InnoDB' do
      primary_key :id
      String :name, null: false, unique: true
      Text :code

      DateTime :created_at
      DateTime :updated_at
    end

  end
end
