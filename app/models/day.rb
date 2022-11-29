class Day < ApplicationRecord
  belongs_to :user
  has_many :consos
  has_many :meats, through: :consos

  validates :date, presence: true
end
