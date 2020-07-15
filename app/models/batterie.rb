class Batterie < ApplicationRecord
  include RailsAdminCharts
  belongs_to :Building
end
