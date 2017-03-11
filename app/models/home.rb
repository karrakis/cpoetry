class Home < ApplicationRecord
	@poem = Poem.get_poem
end