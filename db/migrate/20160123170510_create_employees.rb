class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :fullname
      t.string :address
      t.string :phone
      t.string :employeeRole
      t.string :email
      t.string :branch

      t.timestamps null: false
    end
  end
end
