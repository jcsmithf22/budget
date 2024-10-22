class BucketsController < ApplicationController
  before_action :set_bucket, only: [:show, :edit, :update, :destroy]
  def index
    @buckets = Bucket.includes(:transactions).all
  end

  def show
  end

  def new
    @bucket = Bucket.new
  end

  def create
    @bucket = Bucket.new(bucket_params)

    if @bucket.save
      redirect_to buckets_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
  end

  def update
    if @bucket.update(bucket_params)
      redirect_to buckets_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bucket.destroy

    redirect_to buckets_path
  end

  private

    def bucket_params
      params.require(:bucket).permit(:name, :limit)
    end

    def set_bucket
      @bucket = Bucket.find(params[:id])
    end
end
