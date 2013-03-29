# Call controller that able to record call to file.
# Used as a parent class for all other controllers.
#
class RecordingController < Adhearsion::CallController
  def run
    persisted_call = Call.find! call.id
    persisted_call.kind = call.options[:kind]
    persisted_call.recorded = call.options[:record]
    persisted_call.save

    if call.options[:record] == true
      call.register_event_handler Punchblock::Event::Answered do |event|
        record_result = record async: true do |e|
          logger.info "Call recording saved to #{record_result.recording_uri}"
          # sidekiq here
        end
      end
    end
  end
end
