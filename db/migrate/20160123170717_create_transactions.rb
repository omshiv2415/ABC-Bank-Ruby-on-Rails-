class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :transType
      t.string :method
      t.string :description
      t.float :amount
      t.integer :account_id
      t.integer :employee_id

      t.timestamps null: false
    end
  end
end
