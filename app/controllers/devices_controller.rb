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
end
