class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices, force: true do |t|
      t.string :name, limit: 80
      t.string :accountcode, limit: 20
      t.string :amaflags, limit: 13
      t.string :callgroup, limit: 10
      t.string :callerid, limit: 80
      t.string :canreinvite, limit: 3, default: 'yes'
      t.string :context, limit: 80
      t.string :defaultip, limit: 15
      t.string :dtmfmode, limit: 7
      t.string :fromuser, limit: 80
      t.string :fromdomain, limit: 80
      t.string :fullcontact, limit: 80
      t.string :host, limit: 31, default: 'dynamic'
      t.string :insecure, limit: 4
      t.string :language, limit: 2
      t.string :mailbox, limit: 50
      t.string :md5secret, limit: 80
      t.string :nat, limit: 5, default: 'no'
      t.string :deny, limit: 95
      t.string :permit, limit: 95
      t.string :mask, limit: 95
      t.string :pickupgroup, limit: 10
      t.string :port, limit: 5, default: ''
      t.string :qualify, limit: 3
      t.string :restrictcid, limit: 1
      t.string :rtptimeout, limit: 3
      t.string :rtpholdtimeout, limit: 3
      t.string :secret, limit: 80
      t.string :type, limit: 6, default: 'friend'
      t.string :defaultuser, limit: 80
      t.string :regserver, limit: 20
      t.string :useragent, limit: 20
      t.string :disallow, limit: 100
      t.string :allow, limit: 100
      t.string :musiconhold, limit: 100
      t.integer :regseconds, limit: 11, default: 0
      t.integer :lastms, limit: 11, default: 0
      t.string :ipaddr, limit: 45, default: '0'
      t.string :regexten, limit: 80
      t.string :cancallforward, limit: 3, default: 'yes'
      t.string :setvar, limit: 100
      # additiononal fields of IAX2
      t.string :dbsecret, limit: 100
      t.string :inkeys, limit: 100
      t.string :outkey, limit: 100
      t.string :auth, limit: 100

      t.timestamps
    end
  end
end