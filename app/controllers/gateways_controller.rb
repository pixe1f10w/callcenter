class GatewaysController < InheritedResources::Base
  def show
    @gateway = Gateway.find! params[ :id ]
    @inbound_routes = @gateway.inbound_routes.map { |r| r.sip_uri }
    #@outbound_route = @gateway.outbound_route.map { |r| r.sip_uri }
    @outbound_routes = @gateway.outbound_routes.map { |r| r.sip_uri }
    show!
  end

  def create
    @gateway = Gateway.new params[ :gateway ]
    create!
  end

  def index
    @gateways = Gateway.all
  end

  def edit
    @gateway = Gateway.find! params[ :id ]
    edit!
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

  def destroy
    @gateway = Gateway.find! params[ :id ]
    destroy!
  end
end
