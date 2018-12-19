class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :amount
      t.text :currency
      t.decimal :quotation
      t.text :transaction_type

      t.timestamps
    end
  end
end
