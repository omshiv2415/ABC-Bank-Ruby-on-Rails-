class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :customer_id
      t.string :accountType
      t.float :balance
      t.float :minBalance
      t.string :branch
      t.string :address
      t.date :dob
      t.string :email
      t.string :postcode
      t.string :gender
      t.string :name
      t.string :phone

      t.timestamps null: false
    end
  end
end
