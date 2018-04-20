class CreatePics < ActiveRecord::Migration[5.1]
  def change
    create_table :pics do |t|
      t.string :pic
      t.integer :cate_detail_id
      t.integer :category_id

      t.timestamps
    end
  end
end
