class Service < ApplicationRecord
  has_many :procedures, dependent: :destroy
  has_many :dentists, through: :procedures
  has_many :treatments, through: :procedures
  has_many :appointments, through: :treatments
  has_many :users, through: :appointments
  has_one_attached :photo
  validates :title, :description, :duration, presence: true
end
