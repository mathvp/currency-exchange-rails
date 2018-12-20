class TransactionsController < ApplicationController
  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to @transaction
    else
      empty_error
      render :new
    end
  end

  def new
    @transaction = Transaction.new
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def update
    @transaction = Transaction.find(params[:id])
      
    if @transaction.update(transaction_params)
      redirect_to @transaction
    else
      empty_error
      render :edit
    end
  end

  def destroy
    transaction = Transaction.find(params[:id])
    if transaction.destroy
      redirect_to root_path, flash: { success: 'Transação apagada com sucesso!' }
    else
      transaction.errors.add(:base, 'Erro ao excluir transação')
      redirect_to root_path
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(
      :amount, :currency, :quotation, :transaction_type
    )
  end

  def empty_error
    @transaction.errors.add(:base, 'Você deve informar todos os dados da transação')
  end
end