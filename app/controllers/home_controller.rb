class HomeController < ApplicationController
	def index
		@poemset = Poem.write_poem
		@poem = @poemset.map{|m| m[:line] }
		@legislation = @poemset.map{|m| m[:linewords]}
	end
end