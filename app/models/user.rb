class User < ActiveRecord::Base
	has_many :transactions
	has_many :accounts
	accepts_nested_attributes_for :accounts, :transactions
	before_save { self.email = email.downcase }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

end
