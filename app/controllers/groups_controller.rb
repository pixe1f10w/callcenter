class GroupsController < InheritedResources::Base
  def show
    @group = Group.find! params[ :id ]
#    members = @call_queue.devices
    @attached_devices = @group.devices.map { |d| d.name }
    show!
  end

  def create
    @group = Group.new params[ :group ]
    create!
  end

  def index
    @groups = Group.all
  end

  def edit
    @group = Group.find! params[ :id ]
    edit!
  end

  def update
    @group = Group.find! params[ :id ]
    if @group.update( params[ :group ] )
      flash[ :notice ] = "Queue updated successfully."
      redirect_to groups_path
      #redirect_to polymorphic_url( @participant.group_id )
    else
      render action: 'edit'
    end
  end

  def destroy
    @group = Group.find! params[ :id ]
    flash[ :notice ] = "Group successfully removed."
    destroy!
  end
end
