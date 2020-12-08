class Prescription < ApplicationRecord
  belongs_to :dentist
  belongs_to :user
  belongs_to :appointment
  validates :description, :document, presence: true
  has_one_attached :document
end
