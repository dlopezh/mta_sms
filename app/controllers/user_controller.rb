class UserController < ApplicationController

	def settings
		@user = current_user
	end

	def delete_account
		user = User.find(params[:id])
		user.destroy
		redirect_to '/'
	end

	def send_sms
		@lines = Line.all
end

	def set_sms
	@user = current_user
	line = Line.find(params[:line])
	@user.mobile = params[:mobile].to_i
	@user.save
	@user.line = line
	@user.save
	redirect_to '/'
	end

end