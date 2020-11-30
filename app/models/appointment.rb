class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :dentist_profile
end
