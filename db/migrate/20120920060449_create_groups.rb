class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups, force: true do |t|
      t.string :name, limit: 128
      t.string :musiconhold, limit: 128
      t.string :announce, limit: 128
      t.integer :timeout, limit: 11
      t.boolean :monitor_join
      t.string :monitor_format, limit: 128
      t.string :queue_youarenext, limit: 128
      t.string :queue_thereare, limit: 128
      t.string :queue_callswaiting, limit: 128
      t.string :queue_holdtime, limit: 128
      t.string :queue_minutes, limit: 128
      t.string :queue_seconds, limit: 128
      t.string :queue_lessthan, limit: 128
      t.string :queue_thankyou, limit: 128
      t.string :queue_reporthold, limit: 128
      t.integer :announce_frequency, limit: 11
      t.integer :announce_round_seconds, limit: 11
      t.string :announce_holdtime, limit: 128
      t.integer :retry, limit: 11
      t.integer :wrapuptime, limit: 11
      t.integer :maxlen, limit: 11
      t.integer :servicelevel, limit: 11
      t.string :strategy, limit: 128
      t.string :joinempty, limit: 128
      t.string :leavewhenempty, limit: 128
      t.boolean :eventmemberstatus
      t.boolean :eventwhencalled
      t.boolean :reportholdtime
      t.integer :memberdelay, limit: 11
      t.integer :weight, limit: 11
      t.boolean :timeoutrestart

      t.timestamps
    end
  end
end
