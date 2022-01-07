class Hospital < ApplicationRecord
  has_many :doctors, dependent: :destroy
  has_secure_password
end
