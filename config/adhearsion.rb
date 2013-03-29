# encoding: utf-8
require File.expand_path('../adhearsion/routes', __FILE__)
require File.expand_path('../adhearsion/events', __FILE__)
require File.expand_path('../adhearsion/monkey_patches', __FILE__)

Adhearsion.config do |config|
  config.platform.lib = 'app/call_controllers'

  # Centralized way to specify any Adhearsion platform or plugin configuration
  # - Execute rake config:show to view the active configuration values
  #
  # To update a plugin configuration you can write either:
  #
  #    * Option 1
  #        Adhearsion.config.<plugin-name> do |config|
  #          config.<key> = <value>
  #        end
  #
  #    * Option 2
  #        Adhearsion.config do |config|
  #          config.<plugin-name>.<key> = <value>
  #        end
  config.development do |dev|
    dev.platform.logging.level = :debug
  end

  ##
  # Use with Asterisk
  #
  config.punchblock.platform = :asterisk # Use Asterisk
  config.punchblock.username = "adhearsion" # Your AMI username
  config.punchblock.password = "adhearsion" # Your AMI password
  config.punchblock.host = "127.0.0.1" # Your AMI host
  #config.punchblock.host = "voip.support.core" # Your AMI host
end
