class QueueMembersController < ApplicationController#InheritedResources::Base
  def index
    @group = Group.find params[ :group_id ]
    @queue_members = @group.queue_members
  end

  def show
    @group = Group.find params[ :group_id ]
    @queue_member = @group.queue_members.find params[ :id ]
  end

  def edit
    @group = Group.find params[ :group_id ]
    @queue_member = @group.queue_members.find params[ :id ]
  end

  def update
    @group = Group.find params[ :group_id ]
    @queue_member = @group.queue_members.find params[ :id ]
    if @queue_member.update_attributes params[ :queue_member ]
      flash[ :notice ] = "Queue member updated successfully."
      redirect_to group_queue_members_url( @queue_member.group_id )
      #redirect_to polymorphic_url( @queue_member.group_id )
    else
      render action: 'edit'
    end
  end

  def destroy
    @group = Group.find params[ :group_id ]
    @queue_member = @group.queue_members.find params[ :id ]
    @queue_member.destroy
    flash[ :notice ] = "Queue member successfully removed."
    redirect_to group_queue_members_url( @queue_member.group_id )
  end

  def new
    @group = Group.find params[ :group_id ]
    @devices = Device.all
    @queue_member = @group.queue_members.build #params[ :queue_member ]
  end

  def create
    @group = Group.find params[ :group_id ]
    @queue_member = @group.queue_members.build params[ :queue_member ]
    if @queue_member.save
      flash[ :notice ] = "Successfully created queue member."
      redirect_to group_queue_members_url( @queue_member.group_id )
    else
      render action: 'new'
    end
  end
end
