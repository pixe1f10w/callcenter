Sequel.migration do
  change do

    create_table :devices do #, force: true do |t|
      primary_key :id, limit: 10

      String :name, limit: 80
      String :accountcode, limit: 20
      String :amaflags, limit: 13
      String :callgroup, limit: 10
      String :callerid, limit: 80
      String :canreinvite, limit: 3, default: 'yes'
      String :context, limit: 80
      String :defaultip, limit: 15
      String :dtmfmode, limit: 7
      String :fromuser, limit: 80
      String :fromdomain, limit: 80
      String :fullcontact, limit: 80
      String :host, limit: 31, default: 'dynamic'
      String :insecure, limit: 4
      String :language, limit: 2
      String :mailbox, limit: 50
      String :md5secret, limit: 80
      String :nat, limit: 5, default: 'no'
      String :deny, limit: 95
      String :permit, limit: 95
      String :mask, limit: 95
      String :pickupgroup, limit: 10
      String :port, limit: 5, default: ''
      String :qualify, limit: 3
      String :restrictcid, limit: 1
      String :rtptimeout, limit: 3
      String :rtpholdtimeout, limit: 3
      String :secret, limit: 80
      String :type, limit: 6, default: 'friend'
      String :defaultuser, limit: 80
      String :regserver, limit: 20
      String :useragent, limit: 20
      String :disallow, limit: 100
      String :allow, limit: 100
      String :musiconhold, limit: 100
      Integer :regseconds, limit: 11, default: 0
      Integer :lastms, limit: 11, default: 0
      String :ipaddr, limit: 45, default: '0'
      String :regexten, limit: 80
      String :cancallforward, limit: 3, default: 'yes'
      String :setvar, limit: 100
      # additiononal fields of IAX2
      String :dbsecret, limit: 100
      String :inkeys, limit: 100
      String :outkey, limit: 100
      String :auth, limit: 100

      DateTime :created_at
      DateTime :updated_at
    end

  end
end
