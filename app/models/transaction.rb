class Transaction < ApplicationRecord
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
end