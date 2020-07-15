class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :employee

  def self.graph_data(since = 30.days.ago)
    User.group(:created_at).count.to_a
    # Output
    # [["Bagmati", 3], ["Gandaki", 3], ["Janakpur", 5]]
  end

  def self.chart_type
    'pie'
  end
end
