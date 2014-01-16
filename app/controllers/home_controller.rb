class HomeController < ApplicationController

require 'open-uri'
require 'sanitize'

def index
	
	@user = current_user

	@lines = Line.all

	begin
		@update_time = Line.first.updated_at.in_time_zone('Eastern Time (US & Canada)').strftime("%I:%M%p")
	rescue 
	end

end

end