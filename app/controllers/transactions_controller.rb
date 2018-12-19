class TransactionsController < ApplicationController
  def create
    @transaction = Transaction.new(
      params.require(:transaction).permit(
        :amount, :currency, :quotation, :transaction_type
      )
    )
  end

  def new
    @transaction = Transaction.new
  end

  def show
    @transaction = Transaction.find(params[:id])
  end
end