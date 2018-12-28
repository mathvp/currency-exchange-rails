class User < ApplicationRecord
  has_many   :transactions
  has_one :address
  validates  :name, :email, :cpf, presence: true 
end
