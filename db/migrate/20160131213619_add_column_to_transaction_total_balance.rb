class AddColumnToTransactionTotalBalance < ActiveRecord::Migration
  def change
		add_column :transactions, :total_balance, :float
  end
end
