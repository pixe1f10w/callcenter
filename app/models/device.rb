class Device < ActiveRecord::Base
  attr_accessible :accountcode, :allow, :amaflags, :auth, :callerid, :callgroup, :cancallforward, :canreinvite, :context, :dbsecret, :defaultip, :defaultuser, :deny, :disallow, :dtmfmode, :fromdomain, :fromuser, :fullcontact, :host, :inkeys, :insecure, :ipaddr, :language, :mailbox, :mask, :md5secret, :musiconhold, :name, :nat, :outkey, :permit, :pickupgroup, :port, :qualify, :regexten, :regseconds, :restrictcid, :rtpholdtimeout, :rtptimeout, :secret, :setvar, :type, :username
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :context, presence: true

  def to_i
    @id
  end
end

Device.inheritance_column = 'rails_type'

# == Schema Information
#
# Table name: devices
#
#  id             :integer         not null, primary key
#  name           :string(80)
#  accountcode    :string(20)
#  amaflags       :string(13)
#  callgroup      :string(10)
#  callerid       :string(80)
#  canreinvite    :string(3)       default("yes")
#  context        :string(80)
#  defaultip      :string(15)
#  dtmfmode       :string(7)
#  fromuser       :string(80)
#  fromdomain     :string(80)
#  fullcontact    :string(80)
#  host           :string(31)      default("dynamic")
#  insecure       :string(4)
#  language       :string(2)
#  mailbox        :string(50)
#  md5secret      :string(80)
#  nat            :string(5)       default("no")
#  deny           :string(95)
#  permit         :string(95)
#  mask           :string(95)
#  pickupgroup    :string(10)
#  port           :string(5)       default("")
#  qualify        :string(3)
#  restrictcid    :string(1)
#  rtptimeout     :string(3)
#  rtpholdtimeout :string(3)
#  secret         :string(80)
#  type           :string(6)       default("friend")
#  defaultuser    :string(80)
#  regserver      :string(20)
#  useragent      :string(20)
#  disallow       :string(100)
#  allow          :string(100)
#  musiconhold    :string(100)
#  regseconds     :integer         default(0)
#  lastms         :integer         default(0)
#  ipaddr         :string(45)      default("0")
#  regexten       :string(80)
#  cancallforward :string(3)       default("yes")
#  setvar         :string(100)
#  dbsecret       :string(100)
#  inkeys         :string(100)
#  outkey         :string(100)
#  auth           :string(100)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

