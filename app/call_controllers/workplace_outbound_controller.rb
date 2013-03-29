# encoding: utf-8

class WorkplaceOutboundController < RecordingController
  def run
    super

    dst = "#{call.options[:uplink]}/#{call.to}"
    line = call.options[:line]

    dial(dst, from: line)
    hangup

    return
  end
end
