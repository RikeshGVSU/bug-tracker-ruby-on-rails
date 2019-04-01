class HomeController < ApplicationController
	def index
		@bugs = Bug.last(3)
 	end
end
