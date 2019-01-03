class ChangeBalanceToTotal < ActiveRecord::Migration[5.2]
  def change
    rename_column :transactions, :balance, :total
  end
end
