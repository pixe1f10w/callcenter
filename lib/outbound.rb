# encoding: utf-8

class OutboundCalls < Adhearsion::CallController
  def run
    #puts ' OMGWTF its outta here!11'
    #answer
    dial 'SIP/1015'
    #sleep 5
    #answer
    #sleep 5
    #hangup
  end
end
