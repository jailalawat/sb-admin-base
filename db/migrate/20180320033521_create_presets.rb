class CreatePresets < ActiveRecord::Migration
  def change
    create_table :presets do |t|
      t.string :title
      t.string :path, :limit => 255, :null => false
      t.integer :category_id
      t.boolean :status, :default => true
      
      t.timestamps
    end
  end
end
