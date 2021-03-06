class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :name
      t.string :email
      t.boolean :claimed
      t.text :description
      t.string :blurb
      t.string :state
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
