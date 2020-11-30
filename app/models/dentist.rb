class Dentist < ApplicationRecord
  belongs_to :user
  has_many :procedures
  has_many :treatments, through: :procedures
  has_many :appointments, through: :treatments
  has_many :services, through: :procedures
end
