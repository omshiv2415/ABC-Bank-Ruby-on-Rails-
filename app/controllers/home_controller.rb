class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index

	   	if current_user.try(:admin?)
				@accounts = Account.order(name: :asc).paginate(page: params[:page], per_page: 10)
		  #	@accountsByCust = Account.balance.where(:user_id => current_user.id)
		   elsif current_user
       @transactions = current_user.transactions.all.order(created_at: :desc).paginate(page: params[:page], per_page: 10)

	 	end
  end
	def show
  end

end
