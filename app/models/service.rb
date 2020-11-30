class Service < ApplicationRecord
  has_many :procedures
  has_many :dentists, through: :procedures
  has_many :treatments, through: :procedures
  has_many :appointments, through: :treatments
  has_many :users, through: :appointments
end
