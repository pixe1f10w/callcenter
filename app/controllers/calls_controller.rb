class CallsController < ApplicationController
  def index
    @calls = Call.all
  end

  def show
    @call = Call.find(params[:id])
  end
end
