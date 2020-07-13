class Battery < ApplicationRecord
  belongs_to :Building
  belongs_to :Employee
end
