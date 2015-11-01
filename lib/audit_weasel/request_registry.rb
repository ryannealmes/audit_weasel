module AuditWeasel
  # Registry to store current user which can be accessed across the application
  class RequestRegistry
    extend ::ActiveSupport::PerThreadRegistry

    attr_accessor :current_user
  end
end
