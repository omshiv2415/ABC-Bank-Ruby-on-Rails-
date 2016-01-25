class Account < ActiveRecord::Base
	has_many :transactions
	belongs_to :user
	accepts_nested_attributes_for :transactions, :user

  validates :customer_id, presence: true, length:{minimum:8}
	validates :accountType, presence: true
	validates :balance, presence: true, length: {minimum:1, maximum:15},
	validates :minBalance, presence: true,length: {minimum:1, maximum:5}
	validates :branch, presence: true
	validates :name, presence: true
	validates :address, presence: true
	validates :dob, presence: true
	validates :email, presence: true
	validates :postcode, presence: true
	validates :gender, presence: true
	validates :name, presence: true
	validates :phone, presence: true
end
