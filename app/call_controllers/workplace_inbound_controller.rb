class WorkplaceInboundController < RecordingController
  def run
    super

    target = call.options[:target]
    dial "sip/#{target}"
    hangup

    return
  end
end
