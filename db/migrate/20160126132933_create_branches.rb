class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :branchName
      t.string :branchLocation
      t.string :branchPostcode

      t.timestamps null: false
    end
  end
end
