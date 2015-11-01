module AuditWeasel
  # Add a global user variable for the request i.e. the user making the change
  # This can be accessed anywhere in the application
  module Callbacks
    extend ::ActiveSupport::Concern

    included do
      before_action :set_user_registry
    end

    def set_user_registry
      AuditWeasel::RequestRegistry.current_user = current_user
    end
  end
end
