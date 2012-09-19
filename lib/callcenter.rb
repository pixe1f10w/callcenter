# encoding: utf-8

class CallCenter < Adhearsion::CallController
  def run
    answer
    play 'tt-weasels'
    queue( 'testing_queue' ).join!
  end
end
