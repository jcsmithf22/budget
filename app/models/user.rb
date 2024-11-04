class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  # Add model associations
  has_many :buckets, dependent: :destroy
  has_many :transactions, dependent: :destroy
  has_many :recurrings, dependent: :destroy
  has_many :limits, dependent: :destroy

  has_many :current_month_transactions, -> { current_month.order(date: :desc, id: :desc) }, class_name: "Transaction"

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  validates :email_address, presence: true, uniqueness: true
end
