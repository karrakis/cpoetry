class HomeController < ApplicationController
	def index
		@poem = Poem.new
		@poem
	end
end