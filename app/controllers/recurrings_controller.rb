class RecurringsController < ApplicationController
  before_action :set_recurring, only: [ :show, :edit, :update, :destroy ]

  def index
    @recurrings = Current.user.recurrings.all
  end

  def show
  end

  def new
    @recurring = Current.user.recurrings.new
  end

  def create
    @recurring = Current.user.recurrings.new(recurring_params)

    if @recurring.save
      redirect_to recurrings_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @recurring.update(recurring_params)
      redirect_to recurrings_url
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @recurring.destroy

    redirect_to recurrings_url
  end

  private

    def recurring_params
      params.expect(recurring: [ :name, :amount, :day_of_month, :link ])
    end

    def set_recurring
      @recurring = Current.user.recurrings.find(params[:id])
    end
end
