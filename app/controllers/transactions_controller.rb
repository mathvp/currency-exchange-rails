class TransactionsController < ApplicationController
  def index    
    @transactions = Transaction.all
  end

  def create    
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      redirect_to @transaction
    else
      empty_error
      @users = User.all
      render :new
    end
  end

  def new    
    @transaction = Transaction.new
    @users = User.all
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

  def filter_by_currency
    @transactions = Transaction.find(params[:currency])
  end

  private
  
  def transaction_params
    params.require(:transaction).permit(
      :amount, :currency, :quotation, :transaction_type, :user_id
    )
  end

  def empty_error
    @transaction.errors.add(:base, 'Você deve informar todos os dados da transação')
  end
end