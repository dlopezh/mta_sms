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
	url = "https://api.sendhub.com/v1/messages/?username=9177559495\&api_key=5d04b7c26946c768565d4c10b00c11f58ac526a6"
        @response= HTTParty.post(url, 
        :body => { :contacts => ['+1'+@user.mobile.to_s],
                    :text => @user.line.name + ' - ' + @user.line.status + ' - ' + @user.line.description 
             }.to_json,
    :headers => { 'Content-Type' => 'application/json' } )
	redirect_to '/'
	end
end