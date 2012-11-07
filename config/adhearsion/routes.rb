# encoding: utf-8

Adhearsion.router do

  #
  # Specify your call routes, directing calls with particular attributes to a controller
  #

  #route 'outbound call', Adhearsion::OutboundCall, Outbound
  #route 'bar', OutboundCalls, Adhearsion::OutboundCall, from: /1337/
  route 'baz', OutboundCalls
  route 'foo', CallCenter, to: /789/

  #route 'default', CallCenter
end
