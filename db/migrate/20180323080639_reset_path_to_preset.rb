class ResetPathToPreset < ActiveRecord::Migration
  def change
  	Preset.update_all(path_data: "")
  end
end
