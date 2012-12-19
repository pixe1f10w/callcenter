class DevicesController < InheritedResources::Base
  def show
    @device = Device.find params[ :id ]
    show!
  end

  def create
    @device = Device.new params[ :device ]
    create!
  end

  def index
    @devices = Device.all
  end

  def update
    @device = Device[ params[ :id ] ]
    if @device.update( params[ :device ] )
      flash[ :notice ] = "Device updated successfully."
      redirect_to devices_path
      #redirect_to polymorphic_url( @participant.group_id )
    else
      render action: 'edit'
    end
  end
end
