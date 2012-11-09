# encoding: utf-8

class OutboundCalls < Adhearsion::CallController
  def run
    #puts ' OMGWTF its outta here!11'
    #answer
    puts call.variables
    dial 'SIP/10.0.3.8/89630021387', from: '600986'
    hangup
    #sleep 5
    #answer
    #sleep 5
    #hangup
  end
end
