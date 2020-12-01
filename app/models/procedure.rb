class Procedure < ApplicationRecord
  belongs_to :dentist
  belongs_to :service
  has_many :treatments 
  has_many :appointments, through: :treatments
  has_many :users, through: :appointments
  has_one_attached :photo
end
