class Conso < ApplicationRecord
  belongs_to :day
  belongs_to :meat

  validates :quantity, presence: true
end
