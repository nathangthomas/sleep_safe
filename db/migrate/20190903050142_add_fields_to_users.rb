class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
add_column :users,:first_name, :string
add_column :users,:last_name, :string
add_column :users,:phone_number, :string
add_column :users,:country_code, :bigint
add_column :users,:opt_in, :boolean, default: true
 add_column :users, :enbaled_two_factor, :boolean
 add_column :users, :unconfirmed_two_factor, :boolean
  end
end
