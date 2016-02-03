class Transaction < ActiveRecord::Base
	belongs_to :user
	belongs_to :account

	accepts_nested_attributes_for :account, :user

	validates :amount, :numericality => {:greater_than => 0}
	validates :transType, presence: true, length: {minimum:1, maximum:50}
  validates :description, presence: true ,length: {minimum:1, maximum:50}
	validates :amount, presence: true, length: {minimum:1, maximum:15}
	validates :account_id, presence: true ,length: {minimum:1, maximum:8}


	before_save :debit,  :total_balance

	def debit
	 	#self.t_balance = account.balance - self.amount

		#self.t_balance = self.total_balance - self.amount
  end
end
