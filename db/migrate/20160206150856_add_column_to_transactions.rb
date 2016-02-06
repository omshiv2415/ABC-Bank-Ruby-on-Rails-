class AddColumnToTransactions < ActiveRecord::Migration
  def change
	  add_column :transactions, :t_balance, :float
		add_column :transactions, :total_balance, :float
  end
end
