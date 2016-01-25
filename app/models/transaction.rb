class Transaction < ActiveRecord::Base
	belongs_to :user
	validates :transType, presence: true, length: {minimum:1, maximum:50}
  validates :description, presence: true ,length: {minimum:1, maximum:50}
	validates :amount, presence: true, length: {minimum:1, maximum:15}
	validates :method, presence: true ,length: {minimum:1, maximum:50}
	validates :account_id, presence: true ,length: {minimum:1, maximum:8}
	validates :employee_id, presence: true ,length: {minimum:1, maximum:36}

end
