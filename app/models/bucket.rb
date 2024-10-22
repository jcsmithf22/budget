class Bucket < ApplicationRecord
  has_many :transactions

  validates :name, presence: true
  validates :limit, numericality: { greater_than: 0 }, allow_blank: true
end
