Sequel.migration do
  change do
    create_table :associations, engine: 'InnoDB' do
      primary_key :id
      foreign_key :route_id, :routes, null: false
      Integer :kind, null: false
      String :description
      foreign_key :workplace_id, :devices
      foreign_key :group_id, :groups
      foreign_key :ivr_id, :ivrs
    end
  end
end
