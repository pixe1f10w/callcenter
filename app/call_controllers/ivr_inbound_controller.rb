class IvrInboundController < RecordingController
  def run
    super

    begin
      ivr = Ivr.find! call.options[:ivr]
    rescue Sequel::Plugins::RailsExtensions::ModelNotFound => e
      logger.error "cound not find IVR: #{e.message}"
      ivr = nil
      hangup
    end

    # very naive, must be bounded to context and jailed
    #sandbox = Sandbox.safe
    #sandbox.activate!
    if ivr.present?
      begin
        #sandbox.eval ivr.code
        eval ivr.code
      rescue
        hangup if call.active?
      end
    end

    return
  end
end
