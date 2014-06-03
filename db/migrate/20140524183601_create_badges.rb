class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name
      t.string :company
      t.string :email
      t.integer :user_id 
      t.timestamps
    end
  end
end
