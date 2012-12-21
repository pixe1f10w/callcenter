class ParticipantsController < ApplicationController#InheritedResources::Base
  def index
    @group = Group.find! params[ :group_id ]
    @group_participants = @group.participants
  end

  def show
    @group = Group.find! params[ :group_id ]
    #@participant = @group.participants_dataset.filter( Participant.primary_key_hash( params[ :id ] ) ).first
    @participant = @group.participants.where( Participant.primary_key_hash( params[ :id ] ) ).first
  end

  def edit
    @group = Group.find! params[ :group_id ]
    @participant = @group.participants.where( Participant.primary_key_hash( params[ :id ] ) ).first
  end

  def update
    @group = Group.find! params[ :group_id ]
    @participant = @group.participants.where( Participant.primary_key_hash( params[ :id ] ) ).first
    if @participant.update( params[ :participant ] )
      flash[ :notice ] = "Queue member updated successfully."
      redirect_to group_participants_url( @participant.group_id )
      #redirect_to polymorphic_url( @participant.group_id )
    else
      render action: 'edit'
    end
  end

  def destroy
    @group = Group.find! params[ :group_id ]
    @participant = @group.participants.where( Participant.primary_key_hash( params[ :id ] ) ).first
    @participant.destroy
    flash[ :notice ] = "Queue member successfully removed."
    redirect_to group_participants_url( @participant.group_id )
  end

  def new
    @group = Group.find! params[ :group_id ]
    @workplaces = Workplace.all
    @participant = Participant.new
    @participant.group = @group
  end

  def create
    @group = Group.find! params[ :group_id ]
    @participant = Participant.new
    @participant.group = @group
    @participant.update params[ :participant ]
    if @participant.save
      flash[ :notice ] = "Successfully created queue member."
      redirect_to group_participants_url( @participant.group_id )
    else
      render action: 'new'
    end
  end
end
