class Appointment < ApplicationRecord
  belongs_to :user
  has_many :treatments
  has_many :procedures, through: :treatments
  has_many :dentists, through: :procedures
  has_many :services, through: :procedures

end
