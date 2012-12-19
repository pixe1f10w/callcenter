class Device < Sequel::Model
  plugin :association_proxies
  plugin :association_dependencies
  plugin :validation_helpers

  set_allowed_columns :accountcode, :allow, :amaflags, :auth, :callerid, :callgroup, :cancallforward, :canreinvite, :context, :dbsecret, :defaultip, :defaultuser, :deny, :disallow, :dtmfmode, :fromdomain, :fromuser, :fullcontact, :host, :inkeys, :insecure, :ipaddr, :language, :mailbox, :mask, :md5secret, :musiconhold, :name, :nat, :outkey, :permit, :pickupgroup, :port, :qualify, :regexten, :regseconds, :restrictcid, :rtpholdtimeout, :rtptimeout, :secret, :setvar, :type, :username

  one_to_many :participant
  add_association_dependencies participant: :destroy

  def validate
    super

    validates_presence :name
    validates_presence :context
    validates_unique :name#{ case_sensitive: false }
  end

  def to_i
    @id
  end
end

#Device.inheritance_column = 'rails_type'
