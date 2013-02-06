class WorkplacesController < InheritedResources::Base
  def show
    @workplace = Workplace.find! params[ :id ]
    show!
  end

  def create
    @workplace = Workplace.new params[ :workplace ]
    create!
  end

  def index
    @workplaces = Workplace.all
  end

  def edit
    @workplace = Workplace.find! params[ :id ]
    edit!
  end

  def update
    @workplace = Workplace[ params[ :id ] ]
    if @workplace.update( params[ :workplace ] )
      flash[ :notice ] = "Workplace updated successfully."
      redirect_to workplaces_path
      #redirect_to polymorphic_url( @participant.group_id )
    else
      render action: 'edit'
    end
  end
end
