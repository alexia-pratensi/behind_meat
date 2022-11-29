class Meat < ApplicationRecord
  has_many :consos
  has_many :days, through: :consos

end
