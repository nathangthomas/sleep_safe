class ChangeShelterPhoneNumberToString < ActiveRecord::Migration[5.2]
  def change
    change_column :shelters, :phone_number, :string
  end
end
