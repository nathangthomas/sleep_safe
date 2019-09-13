class AddPlaceIdToShelters < ActiveRecord::Migration[5.2]
  def change
    add_column :shelters, :place_id, :string
  end
end
