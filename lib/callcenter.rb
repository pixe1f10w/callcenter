# encoding: utf-8

class CallCenter < Adhearsion::CallController
  def run
    answer
    puts '************************************'
    puts call.variables
    call.instance_variables.each { |var| puts var }
    puts '************************************'
    play 'tt-weasels'
    queue( CallQueue.all.shuffle.first.name ).join!
  end
end
