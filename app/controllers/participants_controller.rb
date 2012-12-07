class ParticipantsController < ApplicationController#InheritedResources::Base
  def index
    @group = Group.find params[ :group_id ]
    @participants = @group.participants
  end

  def show
    @group = Group.find params[ :group_id ]
    @participant = @group.participants.find params[ :id ]
  end

  def edit
    @group = Group.find params[ :group_id ]
    @participant = @group.participants.find params[ :id ]
  end

  def update
    @group = Group.find params[ :group_id ]
    @participant = @group.participants.find params[ :id ]
    if @participant.update_attributes params[ :participant ]
      flash[ :notice ] = "Queue member updated successfully."
      redirect_to group_participants_url( @participant.group_id )
      #redirect_to polymorphic_url( @participant.group_id )
    else
      render action: 'edit'
    end
  end

  def destroy
    @group = Group.find params[ :group_id ]
    @participant = @group.participants.find params[ :id ]
    @participant.destroy
    flash[ :notice ] = "Queue member successfully removed."
    redirect_to group_participants_url( @participant.group_id )
  end

  def new
    @group = Group.find params[ :group_id ]
    @devices = Device.all
    @participant = @group.participants.build #params[ :participant ]
  end

  def create
    @group = Group.find params[ :group_id ]
    @participant = @group.participants.build params[ :participant ]
    if @participant.save
      flash[ :notice ] = "Successfully created queue member."
      redirect_to group_participants_url( @participant.group_id )
    else
      render action: 'new'
    end
  end
end
