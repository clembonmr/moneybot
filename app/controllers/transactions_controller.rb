class TransactionsController < ApplicationController

  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  def index
    @transactions = Transaction.all
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.new(transaction_params)
  end


  private

  def transaction_params
    params.require(:transaction).permit(:title, :amount, :date, :approved, :note)
  end

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

end
