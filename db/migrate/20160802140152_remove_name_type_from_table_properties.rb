class RemoveNameTypeFromTableProperties < ActiveRecord::Migration
  def change
    rename_column :properties, :type, :properties_type
  end
end
