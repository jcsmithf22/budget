class Bucket < ApplicationRecord
  belongs_to :user, optional: false
  has_many :transactions, -> { order(date: :desc) }

  validates :name, presence: true
  validates :limit, numericality: { greater_than: 0 }, allow_blank: true
end
