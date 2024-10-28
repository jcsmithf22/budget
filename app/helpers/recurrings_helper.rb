module RecurringsHelper
  def day_to_month(day)
    Date.current.change(day: day.clamp(1, Date.current.end_of_month.day))
  end
  def cost_over_time
    @recurrings_grouped ||= @recurrings.group(:day_of_month).sum(:amount).sort

    @recurrings_grouped.each_with_object({}) do |(day, amount), object|
      object[day_to_month(day)] = amount
    end
  end

  def total_over_time
    @recurrings_grouped ||= @recurrings.group(:day_of_month).sum(:amount).sort

    @recurrings_grouped.each_with_object({}) do |(day, amount), object|
      object[day_to_month(day)] = amount + (object.values.last || 0)
    end
  end
end

# @recurrings.group_by(&:day_of_month).transform_values do |recurrings|
#   recurrings.sum(&:amount)
# end

# running_total = 0
# daily_totals.sort.each do |day, amount|
#   running_total += amount
#   [ day, running_total ]
# end
