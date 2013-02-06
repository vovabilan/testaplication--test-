class CreateRenderPostToCategories < ActiveRecord::Migration
  def change
    create_table :render_post_to_categories do |t|
      t.integer :post_id
      t.integer :category_id

      t.timestamps
    end
  end
end
