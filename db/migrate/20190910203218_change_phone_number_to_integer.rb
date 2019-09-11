class ChangePhoneNumberToInteger < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone_number, :bigint
  end
end
 
