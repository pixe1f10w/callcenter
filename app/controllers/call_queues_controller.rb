class CallQueuesController < InheritedResources::Base
  def show
    @call_queue = CallQueue.find params[ :id ]
#    members = @call_queue.devices
    @devices = @call_queue.devices.map { |d| d.name }
    show!
  end

  def create
    @call_queue = CallQueue.new params[ :call_queue ]
    create!
  end

  def index
    @call_queues = CallQueue.all
  end
end
