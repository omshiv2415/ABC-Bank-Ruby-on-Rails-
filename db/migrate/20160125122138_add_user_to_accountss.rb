class AddUserToAccounts < ActiveRecord::Migration
  def change
		add_column :accounts, :user_id, :integer
		add_reference :accounts, :user, index: true
    add_foreign_key :accounts, :users
  end
end
