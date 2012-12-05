# encoding: utf-8

class OutboundCalls < Adhearsion::CallController
  def run
    # recording
    call.register_event_handler Punchblock::Event::Answered do |event|
      #record_result = record async: true, start_beep: true, max_duration: 60_000 do |event|
      record_result = record async: true do |event|
        logger.info "Call recording saved to #{record_result.recording_uri}"
        # sidekiq here
      end
    end

    # uplink
    uplink = call.tags.find { |t| t =~ /^uplink:/ }
    uplink = uplink.split( ':' )[ 1 ]

    #logger.info call.to
    #dst = "SIP/10.0.3.8/#{call.variables[ :x_agi_extension ]}"
    #dst = "SIP/10.0.3.8/#{call.to}"
    dst = "#{uplink}/#{call.to}"
    logger.info dst

    # line number
    number = call.tags.find { |t| t =~ /^line:/ }
    number = number.split( ':' )[ 1 ]

    #logger.info call.inspect
    #logger.info call.tags
    logger.info Adhearsion::active_calls[ call.id ].inspect

    dial( dst, from: number )
    hangup
=begin
    out = Adhearsion::OutboundCall.new
    out.register_event_handler Punchblock::Event::End do |event|
    #out.register_event_handler Punchblock::Event::Unjoined do |event|
      logger.info 'ENDED'
      call.unjoin out
      out.hangup
      call.hangup
    end

    out.register_event_handler Punchblock::Event::Answered do |event|
      logger.info 'ANSWERED'
      call.join out
    end

    out.dial 'SIP/10.0.3.8/89630021387', from: '600986'
    call.wait_for_joined out
#    hangup
=end
=begin
    dial 'SIP/10.0.3.8/89630021387', from: '600986' do #|c|
    #  hangup
    #end
    #Punchblock::Command::Redirect.new( to: 'SIP/10.0.3.8/89630021387' )
      loop do
        raise Adhearsion::Call::Hangup unless call.alive? and call.active?
      end
    end
=end
=begin
    outcall = Adhearsion::OutboundCall.new

    outcall.register_event_handler do |event|
      join outcall if event.name.to_s == "Answered"
      unjoin if event.name.to_s == "Hangup"
    end

    outcall.dial 'SIP/10.0.3.8/89630021387', from: '600986', timeout: 25

    loop do
      raise Adhearsion::Call::Hangup unless call.alive? and call.active?
    end
=end
    #join call
    #hangup
    #hangup
      #c.unjoin
    #  c.hangup
    #end
    #hangup
    #hangup
    #join
    #Adhearsion::OutboundCall.originate 'SIP/10.0.3.8/89630021387', :from => '600986' do |c|
    #  c.hangup
    ##end
  end
end
