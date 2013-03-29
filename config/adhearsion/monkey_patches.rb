#
# Monkey patching Adhearsion::Call class to add options to it.
#
class Adhearsion::Call
  alias_method :_initialize, :initialize
  attr_accessor :options

  def initialize(*args)
    @options = {}
    _initialize(*args)
  end
end
