class Recurring < ApplicationRecord
  belongs_to :user, optional: false

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :day_of_month, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 31 }

  def self.total_over_time
    group(:day_of_month)
      .sum(:amount)
      .sort
      .each_with_object({}) do |(day, amount), object|
      object[day_to_date(day)] = amount + (object.values.last || 0)
    end
  end

  def self.amount_by_day
    group(:day_of_month)
      .sum(:amount)
      .sort
      .each_with_object({}) do |(day, amount), object|
      object[day_to_date(day)] = amount
    end
  end

  def due_date
    Date.current.change(day: day_of_month.clamp(1, Date.current.end_of_month.day))
  end

  def self.day_to_date(day)
    Date.current.change(day: day.clamp(1, Date.current.end_of_month.day))
  end
end
