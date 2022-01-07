class Prescription < ApplicationRecord
  has_one_attached :image
  belongs_to :patient
  belongs_to :doctor
end
