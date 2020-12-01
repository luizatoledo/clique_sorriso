class Appointment < ApplicationRecord
  belongs_to :user
  has_many :treatments
  accepts_nested_attributes_for :treatments, reject_if: :all_blank, allow_destroy: true
  has_many :procedures, through: :treatments
  has_many :dentists, through: :procedures
  has_many :services, through: :procedures

  validates :date, presence: true

end
