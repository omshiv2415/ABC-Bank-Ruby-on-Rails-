class Account < ActiveRecord::Base
	has_many :transactions
	belongs_to :user
	belongs_to :branch

	accepts_nested_attributes_for :transactions, :user

  validates :customer_id, presence: true, length:{minimum:8}
	validates :accountType, presence: true, length: {minimum:1, maximum:15}
	validates :balance, presence: true, length: {minimum:1, maximum:15}
	validates :overdraft, presence: true,length: {minimum:1, maximum:8}
	validates :address, presence: true, length: {minimum:1, maximum:115}
	validates :dob, presence: true
	#validates :email, presence: true
	validates :postcode, presence: true, length: {minimum:7, maximum:7}
	validates :gender, presence: true
	validates :name, presence: true, length: {minimum:1, maximum:70}
	validates :phone, presence: true, length: {minimum:1, maximum:11}
	before_save :user_setup
	after_save :verify_user_account

	private
	def user_setup
		if self.id.blank?
			self.id = self.email
		end
	end

    private

        def verify_user_account
					if created_at == updated_at
					userobject = User.find(self.email)
					userobject.verify = "true"# setting up user verify column to true
					userobject.save
					end
				end

end
