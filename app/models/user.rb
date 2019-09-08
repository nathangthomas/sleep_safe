class User < ApplicationRecord
  devise :two_factor_authenticatable,
         :otp_secret_encryption_key => ENV['ENCRPYTION_KEY']


  devise :authy_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

end
