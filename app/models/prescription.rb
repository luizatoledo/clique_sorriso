class Prescription < ApplicationRecord
  belongs_to :dentist
  belongs_to :user
  belongs_to :appointment
  validates :description, :file, presence: true
  has_one_attached :file
end
