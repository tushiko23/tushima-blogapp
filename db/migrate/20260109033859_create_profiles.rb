class CreateProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :profiles do |t|
      t.references :user, null: false
      t.timestamps
      t.string :nickname
      t.text :introduction
      t.date :birthday
      t.integer :gender
      t.boolean :subscribed, default: false
    end
  end
end
