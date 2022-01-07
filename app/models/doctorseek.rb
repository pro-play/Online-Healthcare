class Doctorseek < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  belongs_to :doctorappoint
end
