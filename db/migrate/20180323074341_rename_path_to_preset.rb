class RenamePathToPreset < ActiveRecord::Migration
  def up
  	rename_column :presets, :path, :path_data
  end

  def down
  	rename_column :presets, :path_data, :path
  end
end
