class AddSupperAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :supper_admin, :boolean, :default => false

  end
end
