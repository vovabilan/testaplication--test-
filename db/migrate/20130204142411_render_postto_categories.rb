class RenderPosttoCategories < ActiveRecord::Migration
  def change
    create_table :PosttoCategories do |t|
      t.integer :user_id
      t.integer :category_id
    end
  end
end
