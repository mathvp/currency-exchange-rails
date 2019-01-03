class Transaction < ApplicationRecord
  belongs_to :user
  validates  :amount, :currency, :quotation, :transaction_type, presence: true
  after_save :update_total

  def to_pt_BR(word)
    translations = {
      dollar: 'Dólar', real: 'Real', buy: 'Compra', sell: 'Venda'
    }
    translations[word.to_sym]
  end

  def total    
    return -amount if transaction_type == 'sell'
    converted_amount
  end
  
  def converted_amount
    return amount / quotation if transaction_type == 'buy' && currency == 'real'
    amount
  end  

  def update_total
    self.update_column(:total, self.total)
  end
end
