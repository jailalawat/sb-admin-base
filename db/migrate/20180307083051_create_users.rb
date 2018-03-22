class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fullName
      t.string :department
      t.string :position
      t.string :email
      t.string :password
      t.string :activeKey
      t.string :status

      t.timestamps
    end
  end
end
