Sequel.migration do
  change do
    create_table(:calls) do
      column :uniqueid, "varchar(255)", :null=>false
      column :from, "varchar(255)"
      column :to, "varchar(255)"
      column :created_at, "datetime"
      column :updated_at, "datetime"
      column :joined_at, "datetime"
      column :unjoined_at, "datetime"
      column :answered_at, "datetime"
      column :ended_at, "datetime"
      column :kind, "varchar(255)"
      column :recorded, "tinyint(1)", :default=>false
      
      primary_key [:uniqueid]
    end
    
    create_table(:devices) do
      primary_key :id, :type=>"int(11)"
      column :name, "varchar(255)"
      column :accountcode, "varchar(255)"
      column :amaflags, "varchar(255)"
      column :callgroup, "varchar(255)"
      column :callerid, "varchar(255)"
      column :canreinvite, "varchar(255)", :default=>"yes"
      column :context, "varchar(255)"
      column :defaultip, "varchar(255)"
      column :dtmfmode, "varchar(255)"
      column :fromuser, "varchar(255)"
      column :fromdomain, "varchar(255)"
      column :fullcontact, "varchar(255)"
      column :host, "varchar(255)", :default=>"dynamic"
      column :insecure, "varchar(255)"
      column :language, "varchar(255)"
      column :mailbox, "varchar(255)"
      column :md5secret, "varchar(255)"
      column :nat, "varchar(255)", :default=>"no"
      column :deny, "varchar(255)"
      column :permit, "varchar(255)"
      column :mask, "varchar(255)"
      column :pickupgroup, "varchar(255)"
      column :port, "varchar(255)"
      column :qualify, "varchar(255)"
      column :restrictcid, "varchar(255)"
      column :rtptimeout, "varchar(255)"
      column :rtpholdtimeout, "varchar(255)"
      column :secret, "varchar(255)"
      column :type, "varchar(255)", :default=>"friend"
      column :defaultuser, "varchar(255)"
      column :regserver, "varchar(255)"
      column :useragent, "varchar(255)"
      column :disallow, "varchar(255)"
      column :allow, "varchar(255)"
      column :musiconhold, "varchar(255)"
      column :regseconds, "int(11)", :default=>0
      column :lastms, "int(11)", :default=>0
      column :ipaddr, "varchar(255)", :default=>"0"
      column :regexten, "varchar(255)"
      column :cancallforward, "varchar(255)", :default=>"yes"
      column :setvar, "varchar(255)"
      column :dbsecret, "varchar(255)"
      column :inkeys, "varchar(255)"
      column :outkey, "varchar(255)"
      column :auth, "varchar(255)"
      column :created_at, "datetime"
      column :updated_at, "datetime"
      column :kind, "varchar(255)", :null=>false
      column :intercom_reachable, "tinyint(1)", :default=>false, :null=>false
      column :callbackextension, "varchar(40)"
      
      index [:kind]
    end
    
    create_table(:groups) do
      primary_key :id, :type=>"int(11)"
      column :name, "varchar(255)"
      column :musiconhold, "varchar(255)"
      column :announce, "varchar(255)"
      column :timeout, "int(11)"
      column :monitor_join, "tinyint(1)"
      column :monitor_format, "varchar(255)"
      column :queue_youarenext, "varchar(255)"
      column :queue_thereare, "varchar(255)"
      column :queue_callswaiting, "varchar(255)"
      column :queue_holdtime, "varchar(255)"
      column :queue_minutes, "varchar(255)"
      column :queue_seconds, "varchar(255)"
      column :queue_lessthan, "varchar(255)"
      column :queue_thankyou, "varchar(255)"
      column :queue_reporthold, "varchar(255)"
      column :announce_frequency, "int(11)"
      column :announce_round_seconds, "int(11)"
      column :announce_holdtime, "varchar(255)"
      column :retry, "int(11)"
      column :wrapuptime, "int(11)"
      column :maxlen, "int(11)"
      column :servicelevel, "int(11)"
      column :strategy, "varchar(255)"
      column :joinempty, "varchar(255)"
      column :leavewhenempty, "varchar(255)"
      column :eventmemberstatus, "tinyint(1)"
      column :eventwhencalled, "tinyint(1)"
      column :reportholdtime, "tinyint(1)"
      column :memberdelay, "int(11)"
      column :weight, "int(11)"
      column :timeoutrestart, "tinyint(1)"
      column :created_at, "datetime"
      column :updated_at, "datetime"
    end
    
    create_table(:ivrs) do
      primary_key :id, :type=>"int(11)"
      column :name, "varchar(255)", :null=>false
      column :code, "text"
      column :created_at, "datetime"
      column :updated_at, "datetime"
      
      index [:name], :name=>:name, :unique=>true
    end
    
    create_table(:schema_migrations) do
      column :filename, "varchar(255)", :null=>false
      
      primary_key [:filename]
    end
    
    create_table(:participants) do
      primary_key :uniqueid, :type=>"int(11)"
      foreign_key :workplace_id, :devices, :type=>"int(11)", :key=>[:id]
      foreign_key :group_id, :groups, :type=>"int(11)", :key=>[:id]
      column :membername, "varchar(255)"
      column :queue_name, "varchar(255)"
      column :interface, "varchar(255)"
      column :penalty, "int(11)"
      column :paused, "int(11)"
      column :created_at, "datetime"
      column :updated_at, "datetime"
      
      index [:group_id], :name=>:group_id
      index [:workplace_id], :name=>:workplace_id
    end
    
    create_table(:routes) do
      primary_key :id, :type=>"int(11)"
      foreign_key :gateway_id, :devices, :type=>"int(11)", :key=>[:id]
      column :sip_uri, "varchar(255)", :null=>false
      column :description, "varchar(255)"
      column :kind, "varchar(255)", :null=>false
      column :created_at, "datetime"
      column :updated_at, "datetime"
      
      index [:gateway_id], :name=>:gateway_id
      index [:kind]
      index [:sip_uri, :kind], :name=>:sip_uri, :unique=>true
    end
    
    create_table(:associations) do
      primary_key :id, :type=>"int(11)"
      foreign_key :route_id, :routes, :type=>"int(11)", :null=>false, :key=>[:id]
      column :kind, "varchar(255)", :null=>false
      column :description, "varchar(255)"
      foreign_key :workplace_id, :devices, :type=>"int(11)", :key=>[:id]
      foreign_key :group_id, :groups, :type=>"int(11)", :key=>[:id]
      foreign_key :ivr_id, :ivrs, :type=>"int(11)", :key=>[:id]
      column :recorded, "tinyint(1)", :default=>false, :null=>false
      column :active, "tinyint(1)", :default=>true
      
      index [:kind]
      index [:group_id], :name=>:group_id
      index [:ivr_id], :name=>:ivr_id
      index [:route_id], :name=>:route_id
      index [:workplace_id], :name=>:workplace_id
    end
  end
end
