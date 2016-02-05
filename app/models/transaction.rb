class Transaction < ActiveRecord::Base
	belongs_to :user
	belongs_to :account

	accepts_nested_attributes_for :account, :user

	validates :amount, :numericality => {:greater_than => 0}
	validates :transType, presence: true, length: {minimum:1, maximum:50}
  validates :description, presence: true ,length: {minimum:1, maximum:50}
	validates :amount, presence: true, length: {minimum:1, maximum:15}
	validates :account_id, presence: true ,length: {minimum:1, maximum:8}

	#before_save :debit
	after_save :debit

  private
	def debit
		 userobject = User.find(current_user)
  end

end
