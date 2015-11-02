class <%= migration_class_name %> < ActiveRecord::Migration
  def change
    add_column :<%= table_name %>, :created_by_user_id, :integer
    add_column :<%= table_name %>, :updated_by_user_id, :integer
  end
end
