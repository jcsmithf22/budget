class RecurringsController < ApplicationController
  before_action :set_recurring, only: [:show, :edit, :update, :destroy]
  def index
    @recurrings = Recurring.all
  end

  def show
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

  def edit
  end

  def update
    if @recurring.update(recurring_params)
      redirect_to recurrings_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recurring.destroy

    redirect_to recurrings_path
  end

  private

    def recurring_params
      params.require(:recurring).permit(:name, :amount, :day_of_month, :link)
    end

    def set_recurring
      @recurring = Recurring.find(params[:id])
    end
end
