class CreateShelters < ActiveRecord::Migration[5.2]
  def change
    create_table :shelters do |t|
      t.string :name
      t.string :website
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :hours
      t.bigint :phone_number
      t.timestamps
    end
  end
end
