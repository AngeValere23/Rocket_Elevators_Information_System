class Elevator < ApplicationRecord
  include RailsAdminCharts
  belongs_to :Column
end
