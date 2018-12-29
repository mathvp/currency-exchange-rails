class HomeController < ApplicationController
  def index
    @transactions = Transaction.where("Date(created_at) = Date(?)", Time.now)
  end

  def filter_currency
    @transactions = Transaction.where("currency = '%s'", params[:currency])
    render :index
  end

  def all
    @transactions = Transaction.all
    render :index
  end
end
