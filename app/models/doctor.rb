class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :patients , through: :previousrecords
  has_many :patients , through: :doctorappoints
  has_many :patients , through: :prescriptions
  has_many :previousrecords, dependent: :destroy
  has_many :doctorappoints, dependent: :destroy
  has_many :prescriptions, dependent: :destroy
  has_secure_password
end
