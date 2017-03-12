class Home < ApplicationRecord
	@poem = Poem.write_poem
end