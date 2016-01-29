class FixColumnName < ActiveRecord::Migration
  def change
		rename_column :accounts, :minBalance, :overdraft
  end
end
