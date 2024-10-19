class Recurring < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :day_of_month, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 31 }, allow_blank: true
end
