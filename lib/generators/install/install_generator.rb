module AuditWeasel
  module Generators
    # Creates a file under initializers which can
    # be used to set configuration settings
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      desc 'This generator creates an initializer file at config/initializers'

      def create_initializer_file
        template 'audit_weasel.rb', 'config/initializers/audit_weasel.rb'
      end
    end
  end
end
