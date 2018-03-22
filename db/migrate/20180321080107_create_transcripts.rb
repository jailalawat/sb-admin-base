class CreateTranscripts < ActiveRecord::Migration
  def change
    create_table :transcripts do |t|
      t.string :content
      t.string :cart_id

      t.timestamps
    end
  end
end
