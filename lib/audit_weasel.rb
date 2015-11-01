require 'active_support/concern'
require 'active_support/per_thread_registry'
require 'active_record'
require 'audit_weasel/version'
require 'audit_weasel/base'
require 'audit_weasel/callbacks'
require 'audit_weasel/request_registry'
require 'audit_weasel/railtie' if defined?(Rails)

# Load all functionality required by the gem
module AuditWeasel
  # configuration to come
end
