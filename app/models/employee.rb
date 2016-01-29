class Employee < ActiveRecord::Base
  belongs_to :branch
  accepts_nested_attributes_for :branch
	validates :fullname, presence: true
	validates :address, presence: true
	validates :phone, presence: true
	validates :employeeRole, presence: true
	validates :email, presence: true
	validates :branch, presence: true
end
