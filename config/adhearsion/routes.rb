# encoding: utf-8

Adhearsion.router do

  #
  # Specify your call routes, directing calls with particular attributes to a controller
  #

  #route 'outbound call', Adhearsion::OutboundCall, Outbound
  #route 'foo', CallCenter, to: /789/
  #route 'bar', OutboundCalls, Adhearsion::OutboundCall, from: /1337/
  unaccepting do
    #route 'outbound calls', OutboundCalls
#=begin
    evented do
      route 'Outbound calls' do |call|
        call.tag 'type:outbound'
        call.tag 'uplink:sip/10.0.3.8'
        call.tag 'line:600512'
        #Adhearsion::CallController.exec( OutboundCalls )
        call.execute_controller OutboundCalls.new( call )
      end
    end
#=end
  end
=begin
  openended do route 'head back to the asterisk' do
      logger.info 'headed back'
    end
  end
=end

  #route 'default', CallCenter
end
