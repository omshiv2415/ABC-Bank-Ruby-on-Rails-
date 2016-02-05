class Transaction < ActiveRecord::Base
	belongs_to :user
	belongs_to :account

	accepts_nested_attributes_for :account, :user

	validates :amount, :numericality => {:greater_than => 0}
	validates :transType, presence: true, length: {minimum:1, maximum:50}
  validates :description, presence: true ,length: {minimum:1, maximum:50}
	validates :amount, presence: true, length: {minimum:1, maximum:15}
	validates :account_id, presence: true ,length: {minimum:1, maximum:8}

	before_save :transaction_update
	#after_save :debit

	private
	def transaction_update
		if self.transType == 'Transfer'
				debit = Account.find(user_id)
				self.total_balance = debit.balance
				self.t_balance = self.total_balance - self.amount
				self.total_balance = self.t_balance
		debit.balance = self.total_balance
		debit.save
		elsif self.transType == 'Deposit'
				credit = Account.find(user_id)
		    self.total_balance = credit.balance
		    self.t_balance = self.total_balance + self.amount
		    self.total_balance = self.t_balance
		credit.balance = self.total_balance
		credit.save
		end
	end


end
