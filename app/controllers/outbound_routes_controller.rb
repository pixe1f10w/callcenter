class OutboundRoutesController < ApplicationController
  def index
    @gateway = Gateway.find! params[ :gateway_id ]
    @gateway_outbound_routes = @gateway.outbound_routes
  end

  def show
    @gateway = Gateway.find! params[ :gateway_id ]
    @outbound_route = @gateway.outbound_routes.where( OutboundRoute.primary_key_hash( params[ :id ] ) ).first
  end

  def edit
    @gateway = Gateway.find! params[ :gateway_id ]
    @outbound_route = @gateway.outbound_routes.where( OutboundRoute.primary_key_hash( params[ :id ] ) ).first
  end

  def update
    @gateway = Gateway.find! params[ :gateway_id ]
    @outbound_route = @gateway.outbound_routes.where( OutboundRoute.primary_key_hash( params[ :id ] ) ).first
    if @outbound_route.update( params[ :outbound_route ] )
      flash[ :notice ] = "Outbound route updated successfully."
      redirect_to gateway_outbound_routes_url( @outbound_route.gateway_id )
    else
      render action: 'edit'
    end
  end

  def destroy
    @gateway = Gateway.find! params[ :gateway_id ]
    @outbound_route = @gateway.outbound_routes.where( OutboundRoute.primary_key_hash( params[ :id ] ) ).first
    @outbound_route.destroy
    flash[ :notice ] = "Outbound route successfully removed."
    redirect_to gateway_outbound_routes_url( @outbound_route.gateway_id )
  end

  def new
    @gateway = Gateway.find! params[ :gateway_id ]
    @outbound_route = OutboundRoute.new
    @outbound_route.gateway = @gateway
  end

  def create
    @gateway = Gateway.find! params[ :gateway_id ]
    @outbound_route = OutboundRoute.new
    @outbound_route.gateway = @gateway
    @outbound_route.update params[ :outbound_route ]
    if @outbound_route.save
      flash[ :notice ] = "Successfully created outbound route."
      redirect_to gateway_outbound_routes_url( @outbound_route.gateway_id )
    else
      render action: 'new'
    end
  end
end
