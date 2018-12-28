class HomeController < ApplicationController
  def index
    if params[:currency].present?
      @transactions = Transaction.where("currency = '%s'", params[:currency])
    else
      @transactions = Transaction.all
    end
  end
end
