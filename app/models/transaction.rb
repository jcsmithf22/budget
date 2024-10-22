class Transaction < ApplicationRecord
  belongs_to :bucket, optional: false

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  # validates :date, presence: true
end
