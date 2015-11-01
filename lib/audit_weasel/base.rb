module AuditWeasel
  # Base functionality to check if a model requires auditing, get the fields
  # that need to be updated and update the auditing fields with the user making
  # the changes
  module Base
    extend ::ActiveSupport::Concern

    included do
      before_save :audit_user, if: proc { |model| model.new_record? || model.changed? }
    end

    private

    def audit_user
      update_fields if current_user
    end

    def update_fields
      fields_to_update.each do |column|
        column = column.to_s
        self[column] = current_user.id if has_attribute?(column)
      end
    end

    def fields_to_update
      if self.new_record?
        audit_fields
      else
        update_audit_fields
      end
    end

    def audit_fields
      create_audit_fields + update_audit_fields
    end

    def update_audit_fields
      [:updated_by_user_id]
    end

    def create_audit_fields
      [:created_by_user_id]
    end

    def current_user
      RequestRegistry.current_user
    end
  end
end
