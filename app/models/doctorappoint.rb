class Doctorappoint < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  has_many :doctorseeks, dependent: :delete_all
  has_many :patienttells, dependent: :delete_all
end
