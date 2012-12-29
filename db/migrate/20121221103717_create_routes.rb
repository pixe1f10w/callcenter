Sequel.migration do
  change do

    #create_table :routes do
    create_table :routes, engine: 'InnoDB'  do
      primary_key :id
      #foreign_key :gateway_id, :gateways
      foreign_key :gateway_id, :devices
      #Integer :gateway_id, null: false
      String :sip_uri, null: false
      String :descr
      Integer :kind, null: false
      DateTime :created_at
      DateTime :updated_at
      unique [ :sip_uri, :kind ]
    end

  end
end