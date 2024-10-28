class Limit < ApplicationRecord
  belongs_to :user, optional: false

  enum :month, [ :january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december ], validate: true

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :year, presence: true
end
