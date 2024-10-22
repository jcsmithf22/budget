class Recurrings::InsightsController < ApplicationController
  before_action :set_recurrings

  def index
  end

  private

    def set_recurrings
      @recurrings = Recurring.all
    end
end
