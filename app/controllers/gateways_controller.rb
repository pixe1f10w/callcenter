class GatewaysController < InheritedResources::Base
  def show
    @gateway = Gateway.find params[ :id ]
    show!
  end

  def create
    @gateway = Gateway.new params[ :gateway ]
    create!
  end

  def index
    @gateways = Gateway.all
  end

  def update
    @gateway = Gateway[ params[ :id ] ]
    if @gateway.update( params[ :gateway ] )
      flash[ :notice ] = "Gateway updated successfully."
      redirect_to gateways_path
      #redirect_to polymorphic_url( @participant.group_id )
    else
      render action: 'edit'
    end
  end
end
