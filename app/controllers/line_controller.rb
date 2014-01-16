class LineController < ApplicationController
	
	def show
		@line = Line.find(params[:id])
	end
end
