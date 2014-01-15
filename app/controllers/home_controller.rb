class HomeController < ApplicationController

require 'open-uri'
require 'sanitize'

def index

@lines = Line.all
@update_time = Line.first.updated_at.in_time_zone('Eastern Time (US & Canada)').strftime("%I:%M%p")

end



end