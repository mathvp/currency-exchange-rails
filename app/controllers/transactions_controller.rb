class TransactionsController < ApplicationController
  def create
    @transaction = Transaction.new(
      params.require(:transaction).permit(
        :amount, :currency, :quotation, :transaction_type
      )
    )
    if @transaction.save
      redirect_to @transaction
    else
      @transaction.errors.add(:base, 'Você deve informar todos os dados da transação')
      render :new
    end
  end

  def new
    @transaction = Transaction.new
  end

  def show
    @transaction = Transaction.find(params[:id])
  end
end