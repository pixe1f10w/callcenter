class Device < Sequel::Model
  plugin :association_proxies
  plugin :association_dependencies
  plugin :validation_helpers
  plugin :single_table_inheritance, :kind, model_map: { 1 => :Workplace, 2 => :Gateway }

  set_allowed_columns :accountcode, :allow, :amaflags, :auth, :callerid, :callgroup, :cancallforward, :canreinvite, :context, :dbsecret, :defaultip, :defaultuser, :deny, :disallow, :dtmfmode, :fromdomain, :fromuser, :fullcontact, :host, :inkeys, :insecure, :ipaddr, :language, :mailbox, :mask, :md5secret, :musiconhold, :name, :nat, :outkey, :permit, :pickupgroup, :port, :qualify, :regexten, :regseconds, :restrictcid, :rtpholdtimeout, :rtptimeout, :secret, :setvar, :type, :username, :intercom_reachable

  def validate
    super
    validates_presence :name
    validates_presence :context
    validates_unique :name#{ case_sensitive: false }
  end
end
