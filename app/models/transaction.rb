class Transaction < ApplicationRecord
  belongs_to :bucket, optional: false
  belongs_to :user, optional: false

  scope :ordered_by_date, -> { order(date: :desc) }
  scope :current_month, -> {
    where(date: Date.current.beginning_of_month..Date.current.end_of_month)
  }
  scope :by_month, ->(date) {
    where(date: date.beginning_of_month..date.end_of_month)
  }

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
