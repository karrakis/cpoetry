class HomeController < ApplicationController
	def index
		@poem = Poem.new
		@poem.write_poem
		@poem
	end
end