class HomeController < ApplicationController
	def index
		@poem = Poem.write_poem
	end
end