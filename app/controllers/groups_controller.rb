class GroupsController < InheritedResources::Base
  def show
    @group = Group.find params[ :id ]
#    members = @call_queue.devices
    @devices = @group.devices.map { |d| d.name }
    show!
  end

  def create
    @group = Group.new params[ :group ]
    create!
  end

  def index
    @groups = Group.all
  end
end
