class TransactionsController < ApplicationController
  before_action :set_buckets, only: [ :new, :create ]

  def index
    @transactions = Transaction.all
  end

  def show
  end

  def new
    if params[:bucket_id]
      @transaction = Transaction.new(bucket_id: params[:bucket_id], date: Date.today)
    else
      @transaction = Transaction.new(date: Date.today)
    end
  end

  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      redirect_to transactions_path
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

    def transaction_params
      params.require(:transaction).permit(:name, :amount, :notes, :bucket_id, :date)
    end

    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    def set_buckets
      @buckets = Bucket.all
    end
end
