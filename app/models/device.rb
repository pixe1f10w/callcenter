class Device < ActiveRecord::Base
  attr_accessible :accountcode, :allow, :amaflags, :auth, :callerid, :callgroup, :cancallforward, :canreinvite, :context, :dbsecret, :defaultip, :defaultuser, :deny, :disallow, :dtmfmode, :fromdomain, :fromuser, :fullcontact, :host, :inkeys, :insecure, :ipaddr, :language, :mailbox, :mask, :md5secret, :musiconhold, :name, :nat, :outkey, :permit, :pickupgroup, :port, :qualify, :regexten, :regseconds, :restrictcid, :rtpholdtimeout, :rtptimeout, :secret, :setvar, :type, :username
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :context, presence: true
end

Device.inheritance_column = 'rails_type'
