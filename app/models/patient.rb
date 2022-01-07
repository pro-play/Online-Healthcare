class Patient < ApplicationRecord
  has_secure_password
  has_many :previousrecords, dependent: :destroy
  has_many :doctorappoints, dependent: :destroy
  has_many :prescriptions, dependent: :destroy
  has_many :doctors , through: :doctorappoints
  has_many :doctors , through: :previousrecords
  has_many :doctors , through: :prescriptions
end
