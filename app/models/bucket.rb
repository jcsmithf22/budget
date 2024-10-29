class Bucket < ApplicationRecord
  belongs_to :user, optional: false
  has_many :transactions, -> { order(date: :desc, id: :desc) }
  has_many :current_month_transactions, -> { current_month.order(date: :desc, id: :desc) }, class_name: "Transaction"
  # has_many :transactions_by_month, ->(month) { by_month(month).order(date: :desc, id: :desc) }, class_name: "Transaction"

  validates :name, presence: true
  validates :limit, numericality: { greater_than: 0 }, allow_blank: true
end
