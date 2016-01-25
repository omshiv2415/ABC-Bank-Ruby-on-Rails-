class Account < ActiveRecord::Base
	has_many :transactions
	has_many :users
	accepts_nested_attributes_for :transactions, :users

  validates :balance, presence: true ,length: {minimum:1, maximum:10}
	validates :minBalance, presence: true, length: {minimum:1, maximum:3}
	validates :address, presence: true ,length: {minimum:10, maximum:150}
	validates :postcode, presence: true ,length: {minimum:7, maximum:7}
	validates :name, presence: true ,length: {minimum:3, maximum:50}
	validates :customer_id, presence: true ,length: {minimum:9, maximum:10}

end
