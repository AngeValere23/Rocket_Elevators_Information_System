class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :employee

    def self.graph_data(since = 30.days.ago)
        array = []

        User.all.group_by {|u| u.CreationDate.beginning_of_month }.each do |key , value|
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
