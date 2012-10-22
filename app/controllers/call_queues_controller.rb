class CallQueuesController < InheritedResources::Base
  def show
    @call_queue = CallQueue.find params[ :id ]
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
