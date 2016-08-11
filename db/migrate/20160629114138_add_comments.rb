class AddComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :description
      t.integer :property_id
      t.integer :user_id, index: true
    end
  end
end
