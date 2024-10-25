class BucketsController < ApplicationController
  before_action :set_bucket, only: [ :show, :edit, :update, :destroy ]

  def index
    @buckets = Current.user.buckets.includes(:transactions).all
  end

  def show
  end

  def new
    @bucket = Current.user.buckets.new
  end

  def create
    @bucket = Current.user.buckets.new(bucket_params)

    if @bucket.save
      redirect_to buckets_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @bucket.update(bucket_params)
      redirect_to buckets_url
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bucket.destroy

    redirect_to buckets_url
  end

  private

    def bucket_params
      params.expect(bucket: [ :name, :limit ])
    end

    def set_bucket
      @bucket = Current.user.buckets.find(params[:id])
    end
end
