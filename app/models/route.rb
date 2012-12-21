class Route < Sequel::Model
  plugin :validation_helpers
  plugin :timestamps

  set_allowed_columns :number, :descr
  many_to_one :gateway

  def before_create
    super
  end

  def validate
    super
  end
end
