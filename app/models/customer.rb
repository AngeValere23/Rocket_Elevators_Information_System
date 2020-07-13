class Customer < ApplicationRecord
  belongs_to :User
  belongs_to :Adress
end
