class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index

		if current_user.try(:admin?)
       @accounts = Account.paginate(page: params[:page], per_page: 10)
		  #	@accountsByCust = Account.balance.where(:user_id => current_user.id)
		elsif current_user
       @transactions = current_user.transactions.paginate(page: params[:page], per_page: 5)

			 @accounts =  Account.find(current_user).balance
			 @balance = @accounts
		 	 @accounts =  Account.find(current_user).overdraft
		 	 @overdraft = @accounts
			 @accounts =  Account.find(current_user).name
			 @name = @accounts
	 	end
  end

	def show
  end

end
