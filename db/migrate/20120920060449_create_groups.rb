Sequel.migration do
  change do

    create_table :groups do #, force: true do |t|
      primary_key :id, limit: 10

      String :name, limit: 128
      String :musiconhold, limit: 128
      String :announce, limit: 128
      Integer :timeout, limit: 11
      Boolean :monitor_join
      String :monitor_format, limit: 128
      String :queue_youarenext, limit: 128
      String :queue_thereare, limit: 128
      String :queue_callswaiting, limit: 128
      String :queue_holdtime, limit: 128
      String :queue_minutes, limit: 128
      String :queue_seconds, limit: 128
      String :queue_lessthan, limit: 128
      String :queue_thankyou, limit: 128
      String :queue_reporthold, limit: 128
      Integer :announce_frequency, limit: 11
      Integer :announce_round_seconds, limit: 11
      String :announce_holdtime, limit: 128
      Integer :retry, limit: 11
      Integer :wrapuptime, limit: 11
      Integer :maxlen, limit: 11
      Integer :servicelevel, limit: 11
      String :strategy, limit: 128
      String :joinempty, limit: 128
      String :leavewhenempty, limit: 128
      Boolean :eventmemberstatus
      Boolean :eventwhencalled
      Boolean :reportholdtime
      Integer :memberdelay, limit: 11
      Integer :weight, limit: 11
      Boolean :timeoutrestart

      DateTime :created_at
      DateTime :updated_at
    end

  end
end
