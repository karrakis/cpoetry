class Poem < ApplicationRecord
	def initialize
	end

	def self.write_poem
		@words = Word.all.sample(250).map{|m| m.as_json.merge(syllables: self.syllables(m['word']))}
		return @words.first
	end

	def self.syllables(word)
		word.scan(/([AEIOUaeiouy]+(?!$|s$|d$))|((?<=k|v|z)[AEIOUaeiouy]+)|(ly$)|(ing$)|((?:p|b)le$)|([^AEIOUY]e(?:s|d)$)/).count
	end
end
