class Building < ApplicationRecord
  belongs_to :Customer
  belongs_to :Adress
end
