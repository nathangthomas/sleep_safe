class DeviseAuthyAddToUsers < ActiveRecord::Migration[5.2]
  def self.up
    change_table :users do |t|
      t.string    :authy_id
      t.datetime  :last_sign_in_with_authy
      t.boolean   :authy_enabled, :default => false
    end

    add_index :users, :authy_id
  end

end
