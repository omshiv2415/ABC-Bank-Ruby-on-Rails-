class Branch < ActiveRecord::Base
  has_many :accounts
	has_many :users
	validates :branchName, presence: true
	validates :branchLocation, presence: true
	validates :branchPostcode, presence: true
end
