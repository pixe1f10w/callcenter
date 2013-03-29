class GroupInboundController < RecordingController
  def run
    super

    begin
      group = Group.find! call.options[:group]
    rescue Sequel::Plugins::RailsExtensions::ModelNotFound => e
      logger.error "could not find group: #{e.message}"
      group = nil
    end

    queue(group.name).join! if group.presend?
    hangup

    return
  end
end
