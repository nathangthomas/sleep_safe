class User < ApplicationRecord

  devise :authy_authenticatable, :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

end
