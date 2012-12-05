module Rails
  class Application
    class Configuration

      def database_configuration
        require 'erb'
        case RUBY_PLATFORM.downcase
          when /java/
            YAML::load(ERB.new(IO.read('config/database_java.yml')).result)
          else
            YAML::load(ERB.new(IO.read(paths["config/database"].first)).result)
        end
      end

    end
  end
end
