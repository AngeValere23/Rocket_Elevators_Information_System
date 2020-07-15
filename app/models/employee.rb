class Employee < ApplicationRecord
  include RailsAdminCharts
  belongs_to :user
end
