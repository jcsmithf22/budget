class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  # Add model associations
  has_many :buckets, dependent: :destroy
  has_many :transactions, dependent: :destroy
  has_many :recurrings, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }
  validates :email_address, presence: true, uniqueness: true
end
