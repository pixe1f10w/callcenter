class CallsController < ApplicationController
  def index
    #@calls = Call.all order: 'created_at DESC'
    @calls = Call.paginate page: params[ :page ], order: 'created_at DESC'
  end

  def show
    @call = Call.find(params[:id])
  end
end
