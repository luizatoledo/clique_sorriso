class Treatment < ApplicationRecord
  belongs_to :appointment
  belongs_to :procedure
end
