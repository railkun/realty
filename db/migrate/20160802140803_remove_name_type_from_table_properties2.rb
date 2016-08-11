class RemoveNameTypeFromTableProperties2 < ActiveRecord::Migration
  def change
    rename_column :properties, :properties_type, :property_type
  end
end
