class Transaction < ActiveRecord::Base
	belongs_to :user
	belongs_to :account
	accepts_nested_attributes_for :user, :account
	validates :amount, :numericality => {:greater_than => 0}
	validates :transType, presence: true, length: {minimum:1, maximum:50}
  validates :description, presence: true ,length: {minimum:1, maximum:50}
	validates :amount, presence: true, length: {minimum:1, maximum:15}
	validates :account_id, presence: true ,length: {minimum:1, maximum:8}

	attr_accessible :account_id, :amount, :description, :employee_id, :method, :transType, :balance


end
