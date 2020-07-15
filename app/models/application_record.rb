class ApplicationRecord < ActiveRecord::Base
  include RailsAdminCharts
  self.abstract_class = true
end
