class QueueMembersController < ApplicationController#InheritedResources::Base
  def index
    @call_queue = CallQueue.find params[ :call_queue_id ]
    @queue_members = @call_queue.queue_members
  end

  def show
    @call_queue = CallQueue.find params[ :call_queue_id ]
    @queue_member = @call_queue.queue_members.find params[ :id ]
  end

  def edit
    @call_queue = CallQueue.find params[ :call_queue_id ]
    @queue_member = @call_queue.queue_members.find params[ :id ]
  end

  def update
    @call_queue = CallQueue.find params[ :call_queue_id ]
    @queue_member = @call_queue.queue_members.find params[ :id ]
    if @queue_member.update_attributes params[ :queue_member ]
      flash[ :notice ] = "Queue member updated successfully."
      redirect_to call_queue_queue_members_url( @queue_member.call_queue_id )
      #redirect_to polymorphic_url( @queue_member.call_queue_id )
    else
      render action: 'edit'
    end
  end

  def destroy
    @call_queue = CallQueue.find params[ :call_queue_id ]
    @queue_member = @call_queue.queue_members.find params[ :id ]
    @queue_member.destroy
    flash[ :notice ] = "Queue member successfully removed."
    redirect_to call_queue_queue_members_url( @queue_member.call_queue_id )
  end

  def new
    @call_queue = CallQueue.find params[ :call_queue_id ]
    @devices = Device.all
    @queue_member = @call_queue.queue_members.build #params[ :queue_member ]
  end

  def create
    @call_queue = CallQueue.find params[:call_queue_id ]
    @queue_member = @call_queue.queue_members.build params[ :queue_member ]
    if @queue_member.save
      flash[ :notice ] = "Successfully created queue member."
      redirect_to call_queue_queue_members_url( @queue_member.call_queue_id )
    else
      render action: 'new'
    end
  end
end
