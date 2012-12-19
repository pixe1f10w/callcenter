require 'sequel/extensions/pagination'
require 'will_paginate/sequel'

class CallsController < ApplicationController
  def index
    page = params[ :page ].nil? ? 1 : params[ :page ].to_i
    @calls = Call.order( :created_at.desc ).paginate( page, 30 )
  end

  def show
    @call = Call.find!( params[ :id ].to_s )
  end
end
