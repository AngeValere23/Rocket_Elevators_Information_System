class Customer < ApplicationRecord
  include RailsAdminCharts
  belongs_to :User
  belongs_to :Adress

  def self.graph_data(since = 30.days.ago)
      array = []

    Customer.all.group_by {|u| u.CreationDate.beginning_of_month }.each do |key , value|
          array.push({
              name: key.strftime("%Y-%B"),
              pointInterval: point_interval = 1.day * 1000,
              pointStart: start_point = since.to_i * 1000,
              array: [value.size]
          })
          end
    end

    def self.chart_type
        "column"
    end
end
