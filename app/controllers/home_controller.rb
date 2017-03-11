class HomeController < ApplicationController
	def index
		@poem = Poem.get_poem
	end
end