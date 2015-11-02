require 'rails/generators/active_record'

module AuditWeasel
  module Generators
    class AuditWeaselGenerator < Rails::Generators::NamedBase
      include Rails::Generators::Migration
      extend ActiveRecord::Generators::Migration

      desc 'Create a migration for a specific table to ' +
      'add the auditing columns required by audit_weasel'

      source_root File.expand_path('../templates', __FILE__)

      def self.next_migration_number(path)
        ActiveRecord::Generators::Base.next_migration_number(path)
      end

      def create_audit_weasel_migration
        migration_template 'migration.rb', "db/migrate/audit_weasel_#{plural_name}.rb"
      end
    end
  end
end
