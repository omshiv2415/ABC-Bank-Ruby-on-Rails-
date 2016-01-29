class Branch < ActiveRecord::Base
  has_many :accounts
	has_many :users
	has_many :employees
	accepts_nested_attributes_for :accounts, :users, :employees
	validates :branchName, presence: true
	validates :branchLocation, presence: true
	validates :branchPostcode, presence: true
end
