class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|

      t.string :name
      t.string :date
      t.string :date
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :description
      t.timestamps
    end
  end
end
