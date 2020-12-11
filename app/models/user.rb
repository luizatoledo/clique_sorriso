class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :dentist
  has_many :appointments
  has_many :messages
  has_many :treatments, through: :appointments
  has_many :procedures, through: :treatments
  has_many :dentists, through: :procedures
  has_many :services, through: :procedures
  has_many :prescriptions
  enum role: [:patient, :dentist]
  
  has_one_attached :photo

  validates :first_name, :last_name, :cpf, :phone_number, :address, :birthday, :role, presence: true
  validates :cpf, uniqueness: true
  validates :role, inclusion: { in: [ 'patient', 'dentist' ] }
  validates :cpf, format: { with: /\d{3}\.\d{3}\.\d{3}-\d{2}/,
  message: "only accepts format XXX.XXX.XXX-XX" }
  validates :phone_number, format: { with: /\(\d{2}\)\d{4,5}-\d{4}/,
  message: "only accepts format (XX)XXXXX-XXXX" }

  def fullname
    full_name = ""
    first_name.split.each { |name| full_name += "#{name.capitalize} "}
    last_name.split.each { |n| full_name += "#{n.capitalize} "}
    full_name.delete_suffix(" ")
  end
end
