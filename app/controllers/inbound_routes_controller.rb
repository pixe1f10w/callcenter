class InboundRoutesController < ApplicationController
  def index
    @gateway = Gateway.find! params[ :gateway_id ]
    @gateway_inbound_routes = @gateway.inbound_routes
  end

  def show
    @gateway = Gateway.find! params[ :gateway_id ]
    @inbound_route = @gateway.inbound_routes.where( InboundRoute.primary_key_hash( params[ :id ] ) ).first
  end

  def edit
    @gateway = Gateway.find! params[ :gateway_id ]
    @inbound_route = @gateway.inbound_routes.where( InboundRoute.primary_key_hash( params[ :id ] ) ).first
  end

  def update
    @gateway = Gateway.find! params[ :gateway_id ]
    @inbound_route = @gateway.inbound_routes.where( InboundRoute.primary_key_hash( params[ :id ] ) ).first
    if @inbound_route.update( params[ :inbound_route ] )
      flash[ :notice ] = "Inbound route updated successfully."
      redirect_to gateway_inbound_routes_url( @inbound_route.gateway_id )
    else
      render action: 'edit'
    end
  end

  def destroy
    @gateway = Gateway.find! params[ :gateway_id ]
    @inbound_route = @gateway.inbound_routes.where( InboundRoute.primary_key_hash( params[ :id ] ) ).first
    @inbound_route.destroy
    flash[ :notice ] = "Inbound route successfully removed."
    redirect_to gateway_inbound_routes_url( @inbound_route.gateway_id )
  end

  def new
    @gateway = Gateway.find! params[ :gateway_id ]
    @inbound_route = InboundRoute.new
    @inbound_route.gateway = @gateway
  end

  def create
    @gateway = Gateway.find! params[ :gateway_id ]
    @inbound_route = InboundRoute.new
    @inbound_route.gateway = @gateway
    @inbound_route.update params[ :inbound_route ]
    if @inbound_route.save
      flash[ :notice ] = "Successfully created inbound route."
      redirect_to gateway_inbound_routes_url( @inbound_route.gateway_id )
    else
      render action: 'new'
    end
  end
end
