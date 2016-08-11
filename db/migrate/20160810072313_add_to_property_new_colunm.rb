class AddToPropertyNewColunm < ActiveRecord::Migration
  def change
    add_column :properties, :price_type, :integer
  end
end
