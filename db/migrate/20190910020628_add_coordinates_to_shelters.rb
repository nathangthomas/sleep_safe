class AddCoordinatesToShelters < ActiveRecord::Migration[5.2]
  def change
    add_column :shelters, :latitude, :float
    add_column :shelters, :longitude, :float
  end
end
