class Employee < ActiveRecord::Base



	validates :fullname, presence: true
	validates :address, presence: true
	validates :phone, presence: true
	validates :employeeRole, presence: true
	validates :email, presence: true
	validates :branch, presence: true
end
