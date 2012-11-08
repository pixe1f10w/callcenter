# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121023081657) do

  create_table "call_queues", :force => true do |t|
    t.string   "name",                   :limit => 128
    t.string   "musiconhold",            :limit => 128
    t.string   "announce",               :limit => 128
    t.integer  "timeout"
    t.boolean  "monitor_join"
    t.string   "monitor_format",         :limit => 128
    t.string   "queue_youarenext",       :limit => 128
    t.string   "queue_thereare",         :limit => 128
    t.string   "queue_callswaiting",     :limit => 128
    t.string   "queue_holdtime",         :limit => 128
    t.string   "queue_minutes",          :limit => 128
    t.string   "queue_seconds",          :limit => 128
    t.string   "queue_lessthan",         :limit => 128
    t.string   "queue_thankyou",         :limit => 128
    t.string   "queue_reporthold",       :limit => 128
    t.integer  "announce_frequency"
    t.integer  "announce_round_seconds"
    t.string   "announce_holdtime",      :limit => 128
    t.integer  "retry"
    t.integer  "wrapuptime"
    t.integer  "maxlen"
    t.integer  "servicelevel"
    t.string   "strategy",               :limit => 128
    t.string   "joinempty",              :limit => 128
    t.string   "leavewhenempty",         :limit => 128
    t.boolean  "eventmemberstatus"
    t.boolean  "eventwhencalled"
    t.boolean  "reportholdtime"
    t.integer  "memberdelay"
    t.integer  "weight"
    t.boolean  "timeoutrestart"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  create_table "devices", :force => true do |t|
    t.string   "name",           :limit => 80
    t.string   "accountcode",    :limit => 20
    t.string   "amaflags",       :limit => 13
    t.string   "callgroup",      :limit => 10
    t.string   "callerid",       :limit => 80
    t.string   "canreinvite",    :limit => 3,   :default => "yes"
    t.string   "context",        :limit => 80
    t.string   "defaultip",      :limit => 15
    t.string   "dtmfmode",       :limit => 7
    t.string   "fromuser",       :limit => 80
    t.string   "fromdomain",     :limit => 80
    t.string   "fullcontact",    :limit => 80
    t.string   "host",           :limit => 31,  :default => "dynamic"
    t.string   "insecure",       :limit => 4
    t.string   "language",       :limit => 2
    t.string   "mailbox",        :limit => 50
    t.string   "md5secret",      :limit => 80
    t.string   "nat",            :limit => 5,   :default => "no"
    t.string   "deny",           :limit => 95
    t.string   "permit",         :limit => 95
    t.string   "mask",           :limit => 95
    t.string   "pickupgroup",    :limit => 10
    t.string   "port",           :limit => 5,   :default => ""
    t.string   "qualify",        :limit => 3
    t.string   "restrictcid",    :limit => 1
    t.string   "rtptimeout",     :limit => 3
    t.string   "rtpholdtimeout", :limit => 3
    t.string   "secret",         :limit => 80
    t.string   "type",           :limit => 6,   :default => "friend"
    t.string   "defaultuser",    :limit => 80
    t.string   "regserver",      :limit => 20
    t.string   "useragent",      :limit => 20
    t.string   "disallow",       :limit => 100
    t.string   "allow",          :limit => 100
    t.string   "musiconhold",    :limit => 100
    t.integer  "regseconds",                    :default => 0
    t.integer  "lastms",                        :default => 0
    t.string   "ipaddr",         :limit => 45,  :default => "0"
    t.string   "regexten",       :limit => 80
    t.string   "cancallforward", :limit => 3,   :default => "yes"
    t.string   "setvar",         :limit => 100
    t.string   "dbsecret",       :limit => 100
    t.string   "inkeys",         :limit => 100
    t.string   "outkey",         :limit => 100
    t.string   "auth",           :limit => 100
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  create_table "extensions", :force => true do |t|
    t.string   "context",    :limit => 20,                 :null => false
    t.string   "exten",      :limit => 20,                 :null => false
    t.integer  "priority",                  :default => 0
    t.string   "app",        :limit => 20,                 :null => false
    t.string   "appdata",    :limit => 128,                :null => false
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "queue_members", :primary_key => "uniqueid", :force => true do |t|
    t.string   "membername",    :limit => 40
    t.string   "queue_name",    :limit => 128
    t.string   "interface",     :limit => 128
    t.integer  "penalty"
    t.integer  "paused"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "device_id"
    t.integer  "call_queue_id"
  end

end
