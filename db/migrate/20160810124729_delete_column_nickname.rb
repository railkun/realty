class DeleteColumnNickname < ActiveRecord::Migration
  def change
    remove_column :users, :nickname
  end
end
