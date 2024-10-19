class RecurringsController < ApplicationController
  def index
    @recurrings = Recurring.all
  end

  def new
    @recurring = Recurring.new
  end

  def create
    @recurring = Recurring.new(recurring_params)

    if @recurring.save
      redirect_to recurrings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    def recurring_params
      params.require(:recurring).permit(:name, :amount, :day_of_month, :link)
    end

    def set_recurring
      @recurring = Recurring.find(params[:id])
    end
end
