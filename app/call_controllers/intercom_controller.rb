# encoding: utf-8

class IntercomController < RecordingController
  def run
    super

    dial "SIP/#{call.to}"
    hangup

    return
  end
end

