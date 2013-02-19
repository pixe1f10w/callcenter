class GroupAssociationsController < ApplicationController
  before_filter :set_group
  before_filter :set_group_association, except: [ :index, :new, :create ]#, :show, :edit ]

  def index
    @group_associations = []
    @group_associations = @group.inbound_associations if params[ :kind_of_route ] == :inbound
  end

  def show
  end

  def edit
  end

  def update
    if @group_association.update params[ :group_association ]
      flash[ :notice ] = "Route updated successfully."

      case params[ :kind_of_route ]
      when :inbound then
        redirect_to group_inbound_routes_url( @group_association.group )
      when :oubound then
        redirect_to group_url( @group )
      end
    else
      render action: 'edit'
    end
  end

  def destroy
    @group_association.destroy
    flash[ :notice ] = "Route successfully removed"

    case params[ :kind_of_route ]
    when :inbound then
      redirect_to group_inbound_routes_url( @group_association.group )
    when :outbound then
      redirect_to group_url( @group_association.group )
    end
  end

  def new
    @group_association = GroupAssociation.new
    @group_association.group = @group

    routes = []

    case params[ :kind_of_route ]
    when :inbound then
      routes = InboundRoute.all - @group.inbound_associations.map { |a| a.associated_route }
    when :outbound then
      routes = OutboundRoute.all if @group.outbound_association.nil?
    end

    if routes.empty?
      case params[ :kind_of_route ]
      when :inbound then
        flash[ :error ] = "No more unattached routes available for this group"
        redirect_to group_inbound_routes_url @group
      when :outbound then
        if not @group.outbound_association.present?
          flash[ :error ] = "No routes are available to attach"
        else
          flash[ :error ] = "Group already has outbound route attached"
        end

        redirect_to group_path( @group )
      end
    else
      @available_routes = routes
    end
  end

  def create
    @group_association = GroupAssociation.new
    @group_association.group = @group
    @group_association.update params[ :group_association ]
    if @group_association.save
      flash[ :notice ] = "Successfully created route."

      case params[ :kind_of_route ]
      when :inbound then
        redirect_to group_inbound_routes_url @group_association.group
      when :outbound then
        redirect_to group_url @group_association.group
        #redirect_to calls_url
      end
    else
      render action: 'new'
    end
  end

  private
  def set_group
    @group = Group.find! params[ :group_id ]
  end

  def set_group_association
    case params[ :kind_of_route ]
    when :outbound then
      @group_association = @group.outbound_association
    when :inbound then
      #@group_association = @group.inbound_associations_dataset.where( id: params[ :id ] ).first
      @group_association = @group.inbound_association params[ :id ]
    end

    # check for existance
    if @group_association.nil?
      flash[ :error ] = "Route is absent"
      case params[ :kind_of_route ]
      when :inbound then
        redirect_to group_inbound_routes_url( @group_association.group )
      when :outbound then
        redirect_to group_url( @group )
      end
    end
  end
end
