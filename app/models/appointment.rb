class Appointment < ApplicationRecord
  belongs_to :user
  has_one :chatroom, dependent: :destroy
  has_many :treatments, dependent: :destroy
  accepts_nested_attributes_for :treatments, reject_if: :all_blank, allow_destroy: true
  has_many :procedures, through: :treatments
  has_many :dentists, through: :procedures
  has_many :services, through: :procedures
  has_many :prescriptions
  validates :date, presence: true, on: :update

  def appoint_duration
    duration = 0
    self.services.each do |service|
      duration += service.duration
    end
    duration
  end

end
