class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
    	t.integer :user_id
      t.string :chassis
      t.string :title
      t.string :model
      t.datetime :manufacturing_date
      t.string :avatar
      t.timestamps
    end
  end
end
