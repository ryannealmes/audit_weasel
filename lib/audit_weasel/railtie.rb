module AuditWeasel
  # Load railties for auditing
  class Railtie < Rails::Railtie
    initializer 'active_record.add_auditing' do
      ActiveSupport.on_load(:active_record) do
        include AuditWeasel::Base
      end
    end

    initializer 'action_controller.add_auditing' do
      ActiveSupport.on_load(:action_controller) do
        include AuditWeasel::Callbacks
      end
    end
  end
end
