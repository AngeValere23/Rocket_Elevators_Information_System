class Customer < ApplicationRecord
  include RailsAdminCharts
  belongs_to :User
  belongs_to :Adress
end
