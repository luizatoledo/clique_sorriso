class Dentist < ApplicationRecord
  belongs_to :user
  has_many :procedures
  has_many :treatments, through: :procedures
  has_many :appointments, through: :treatments
  has_many :services, through: :procedures

  validades: :cro, :specialty, :approved, presence: true
  
  # validates :cro, format: { with: /\(\d{2}\)\d{4,5}-\d{4}/,
  # message: "only accepts format (XX)XXXXX-XXXX" }

end
