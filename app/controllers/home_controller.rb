class HomeController < ApplicationController
	def index
		@bugs = Bug.last(3)
		respond_to do |format|
	     format.html {render :index}
	     format.json {render :index, status: :ok}
	     format.xml {render xml: @bugs.as_json}
	    end 
 	end
end