class TransactionsController < ApplicationController
  before_action :set_buckets, only: [ :new, :create ]

  def index
    @transactions = Current.user.transactions.all
  end

  def show
  end

  def new
    @transaction = Current.user.transactions.new(date: Date.today)
    if params[:bucket_id]
      @transaction.bucket_id = params[:bucket_id]
    end
  end

  def create
    @transaction = Current.user.transactions.new(transaction_params)

    if @transaction.save
      redirect_to buckets_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    def transaction_params
      params.expect(transaction: [ :name, :amount, :notes, :bucket_id, :date ])
    end

    def set_transaction
      @transaction = Current.user.transactions.find(params[:id])
    end

    def set_buckets
      @buckets = Current.user.buckets.all
    end
end
