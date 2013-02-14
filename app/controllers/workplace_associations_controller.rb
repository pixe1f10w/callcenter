class WorkplaceAssociationsController < ApplicationController
  # TODO: DRY refactoring needed
  before_filter :set_workplace
  before_filter :set_workplace_association, except: [ :index, :new, :create ]#, :show, :edit ]

  def index
    @workplace_associations = []
    @workplace_associations = @workplace.inbound_associations if params[ :kind_of_route ] == :inbound
  end

  def show
  end

  def edit
  end

  def update
    if @workplace_association.update params[ :workplace_association ]
      flash[ :notice ] = "Route updated successfully."

      case params[ :kind_of_route ]
      when :inbound then
        redirect_to workplace_inbound_routes_url( @workplace_association.workplace )
      when :oubound then
        redirect_to workplace_url( @workplace )
      end
    else
      render action: 'edit'
    end
  end

  def destroy
    @workplace_association.destroy
    flash[ :notice ] = "Route successfully removed"

    case params[ :kind_of_route ]
    when :inbound then
      redirect_to workplace_inbound_routes_url( @workplace_association.workplace )
    when :outbound then
      redirect_to workplace_url( @workplace_association.workplace )
    end
  end

  def new
    @workplace_association = WorkplaceAssociation.new
    @workplace_association.workplace = @workplace

    routes = []

    case params[ :kind_of_route ]
    when :inbound then
      routes = InboundRoute.all - @workplace.inbound_associations.map { |a| a.associated_route }
    when :outbound then
      routes = OutboundRoute.all if @workplace.outbound_association.nil?
    end

    if routes.empty?
      case params[ :kind_of_route ]
      when :inbound then
        flash[ :error ] = "No more unattached routes available for this workplace"
        redirect_to workplace_inbound_routes_url @workplace
      when :outbound then
        flash[ :error ] = "Workplace already has outbound route attached"
        redirect_to workplace_path( @workplace )
      end
    else
      @available_routes = routes
    end
  end

  def create
    @workplace_association = WorkplaceAssociation.new
    @workplace_association.workplace = @workplace
    @workplace_association.update params[ :workplace_association ]
    if @workplace_association.save
      flash[ :notice ] = "Successfully created route."

      case params[ :kind_of_route ]
      when :inbound then
        redirect_to workplace_inbound_routes_url @workplace_association.workplace
      when :outbound then
        redirect_to workplace_url @workplace_association.workplace
        #redirect_to calls_url
      end
    else
      render action: 'new'
    end
  end

  private
  def set_workplace
    @workplace = Workplace.find! params[ :workplace_id ]
  end

  def set_workplace_association
    case params[ :kind_of_route ]
    when :outbound then
      @workplace_association = @workplace.outbound_association
    when :inbound then
      #@workplace_association = @workplace.inbound_associations_dataset.where( id: params[ :id ] ).first
      @workplace_association = @workplace.inbound_association params[ :id ]
    end

    # check for existance
    if @workplace_association.nil?
      flash[ :error ] = "Route is absent"
      case params[ :kind_of_route ]
      when :inbound then
        redirect_to workplace_inbound_routes_url( @workplace_association.workplace )
      when :outbound then
        redirect_to workplace_url( @workplace )
      end
    end
  end
end
