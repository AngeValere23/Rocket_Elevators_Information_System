class Battery < ApplicationRecord
  include RailsAdminCharts
  belongs_to :Building
  belongs_to :Employee
end
