class DropUsersTable < ActiveRecord::Migration
  def up
    drop_table :users
  end

  def down
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email

      t.timestamps    
    end
  end
end
