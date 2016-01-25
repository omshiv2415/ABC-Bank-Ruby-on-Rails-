class WelcomesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
		if  current_user
	      redirect_to transactions_path

	 end
  end

	def show
  end
  def check
		redirect_to transactions_path
	end

end
