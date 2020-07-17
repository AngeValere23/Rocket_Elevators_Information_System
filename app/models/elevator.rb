class Elevator < ApplicationRecord
  belongs_to :Column

  def userid
    return self.Column.battery.building.customer.user.id
  end
end
