class AddColumnToTransaction < ActiveRecord::Migration
  def change
		add_column :transactions, :t_balance, :float
  end
end
