class Prescription < ApplicationRecord
  belongs_to :dentist
  belongs_to :user
  belongs_to :appointment
end
