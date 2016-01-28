class ChangeColumnName < ActiveRecord::Migration
  def change
		rename_column :accounts, :branch, :branchName
  end
end
