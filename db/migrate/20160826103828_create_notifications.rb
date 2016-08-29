class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :description
      t.integer :category
      t.string :email

      t.timestamps null: false
    end
  end
end
