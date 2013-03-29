class IvrsController < InheritedResources::Base
  def show
    @ivr = Ivr.find! params[ :id ]
    show!
  end

  def create
    @ivr = Ivr.new params[ :ivr ]
    create!
  end

  def index
    @ivrs = Ivr.all
  end

  def edit
    @ivr = Ivr.find! params[ :id ]
    edit!
  end

  def update
    @ivr = Ivr[ params[ :id ] ]
    if @ivr.update( params[ :ivr ] )
      flash[ :notice ] = "Ivr updated successfully."
      redirect_to ivrs_path
      #redirect_to polymorphic_url( @participant.group_id )
    else
      render action: 'edit'
    end
  end

  def destroy
    @ivr = Ivr.find! params[ :id ]
    destroy!
  end
end
