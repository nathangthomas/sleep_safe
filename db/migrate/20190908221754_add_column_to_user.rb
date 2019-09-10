class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :country_code, :integer, default: 1
  end
end
