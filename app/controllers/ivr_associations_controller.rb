class IvrAssociationsController < ApplicationController
  # TODO: DRY refactoring needed
  before_filter :set_ivr
  before_filter :set_ivr_association, except: [ :index, :new, :create ]#, :show, :edit ]

  def index
    @ivr_associations = []
    @ivr_associations = @ivr.inbound_associations if params[ :kind_of_route ] == :inbound
  end

  def show
  end

  def edit
  end

  def update
    if @ivr_association.update params[ :ivr_association ]
      flash[ :notice ] = "Route updated successfully."

      case params[ :kind_of_route ]
      when :inbound then
        redirect_to ivr_inbound_routes_url( @ivr_association.ivr )
      when :oubound then
        redirect_to ivr_url( @ivr )
      end
    else
      render action: 'edit'
    end
  end

  def destroy
    @ivr_association.destroy
    flash[ :notice ] = "Route successfully removed"

    case params[ :kind_of_route ]
    when :inbound then
      redirect_to ivr_inbound_routes_url( @ivr_association.ivr )
    when :outbound then
      redirect_to ivr_url( @ivr_association.ivr )
    end
  end

  def new
    @ivr_association = IvrAssociation.new
    @ivr_association.ivr = @ivr

    routes = []

    case params[ :kind_of_route ]
    when :inbound then
      routes = InboundRoute.all - @ivr.inbound_associations.map { |a| a.associated_route }
    when :outbound then
      routes = OutboundRoute.all if @ivr.outbound_association.nil?
    end

    if routes.empty?
      case params[ :kind_of_route ]
      when :inbound then
        flash[ :error ] = "No more unattached routes available for this ivr"
        redirect_to ivr_inbound_routes_url @ivr
      when :outbound then
        flash[ :error ] = "ivr already has outbound route attached"
        redirect_to ivr_path( @ivr )
      end
    else
      @available_routes = routes
    end
  end

  def create
    @ivr_association = IvrAssociation.new
    @ivr_association.ivr = @ivr
    @ivr_association.update params[ :ivr_association ]
    if @ivr_association.save
      flash[ :notice ] = "Successfully created route."

      case params[ :kind_of_route ]
      when :inbound then
        redirect_to ivr_inbound_routes_url @ivr_association.ivr
      when :outbound then
        redirect_to ivr_url @ivr_association.ivr
        #redirect_to calls_url
      end
    else
      render action: 'new'
    end
  end

  private
  def set_ivr
    @ivr = Ivr.find! params[ :ivr_id ]
  end

  def set_ivr_association
    case params[ :kind_of_route ]
    when :outbound then
      @ivr_association = @ivr.outbound_association
    when :inbound then
      #@ivr_association = @ivr.inbound_associations_dataset.where( id: params[ :id ] ).first
      @ivr_association = @ivr.inbound_association params[ :id ]
    end

    # check for existance
    if @ivr_association.nil?
      flash[ :error ] = "Route is absent"
      case params[ :kind_of_route ]
      when :inbound then
        redirect_to ivr_inbound_routes_url( @ivr_association.ivr )
      when :outbound then
        redirect_to ivr_url( @ivr )
      end
    end
  end
end
