class Poem < ApplicationRecord
	def self.write_poem
		@words = Word.all.sample(250).map{|m| m.as_json.merge(syllables: syllables(m['word']))}
		return @words.first
	end

	def self.syllables(word)
		word.scan(/([AEIOUaeiouy]+(?!$|s$|d$))|((?<=k|v|z)[AEIOUaeiouy]+)|(ly$)|(ing$)|((?:p|b)le$)|([^AEIOUY]e(?:s|d)$)/).count
	end
end
