class Transaction < ApplicationRecord
  belongs_to :bucket, optional: false
  belongs_to :user, optional: false

  scope :ordered_by_date, -> { order(date: :desc) }

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  # validates :date, presence: true
end
