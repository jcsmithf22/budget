class LimitsController < ApplicationController
  before_action :set_limit, only: [ :edit, :update ]

  def new
    @limit = Current.user.limits.new
  end

  def create
    @limit = Current.user.limits.new(limit_params)
    @limit.month = Date.today.month
    @limit.year = Date.today.year

    if @limit.save
      redirect_to buckets_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @limit.update(limit_params)
      redirect_to buckets_url
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

    def limit_params
      params.expect(limit: [ :amount ])
    end

    def set_limit
      @limit = Current.user.limits.find(params[:id])
    end
end