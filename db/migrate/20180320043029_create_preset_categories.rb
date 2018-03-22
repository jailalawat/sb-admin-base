class CreatePresetCategories < ActiveRecord::Migration
  def change
    create_table :preset_categories do |t|
      t.string :title
      t.boolean :status
      t.timestamps
    end
  end
end
