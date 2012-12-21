Sequel.migration do
  change do

    create_table :routes do
      primary_key :id
      String :number, null: false
      String :descr
      Integer :gateway_id, null: false
      Integer :kind, null: false
      DateTime :created_at
      DateTime :updated_at
    end

  end
end
