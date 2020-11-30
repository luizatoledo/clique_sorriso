class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :dentist
  has_many :appointments
  has_many :treatments, through: :appointments
  has_many :procedures, through: :treatments
  has_many :dentists, through: :procedures
  has_many :services, through: :procedures
  
  enum role: [:patient, :dentist]
  
  has_one_attached :photo

  validates :first_name, :last_name, :cpf, :phone_number, :address, :birthday, :role, :admin, presence: true
  validates :cpf, uniqueness: true
  validades :role, inclusion: { in: [0,1] }
  validates :cpf, format: { with: /\d{3}\.\d{3}\.\d{3}-\d{2}/,
  message: "only accepts format XXX.XXX.XXX-XX" }
  validates :phone_number, format: { with: /\(\d{2}\)\d{4,5}-\d{4}/,
  message: "only accepts format (XX)XXXXX-XXXX" }

end
