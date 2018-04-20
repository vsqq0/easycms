class CreateCateDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :cate_details do |t|
      t.string :title
      t.string :text
      t.string :img
      t.integer :category_id
      t.string :link
      t.string :subtitle

      t.timestamps
    end
  end
end
