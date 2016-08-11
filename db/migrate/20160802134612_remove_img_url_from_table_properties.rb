class RemoveImgUrlFromTableProperties < ActiveRecord::Migration
  def change
    remove_column :properties, :img_url
  end
end
