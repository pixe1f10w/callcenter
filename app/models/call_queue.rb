class CallQueue < ActiveRecord::Base
  attr_accessible :announce, :announce_frequency, :announce_holdtime, :announce_round_seconds, :eventmemberstatus, :eventwhencalled, :joinempty, :leavewhenempty, :maxlen, :memberdelay, :monitor_format, :monitor_join, :musiconhold, :name, :queue_callswaiting, :queue_holdtime, :queue_lessthan, :queue_minutes, :queue_reporthold, :queue_seconds, :queue_thankyou, :queue_thereare, :queue_youarenext, :reportholdtime, :retry, :servicelevel, :strategy, :timeout, :timeoutrestart, :weight, :wrapuptime
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
