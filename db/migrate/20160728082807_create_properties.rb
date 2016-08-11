class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.text :title
      t.text :description
      t.string :address
      t.string :area
      t.integer :apartment
      t.integer :price
      t.integer :type
      t.string :img_url
      t.integer :user_id, index: true
      t.timestamps null: false
    end
  end
end
