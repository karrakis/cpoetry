class Poem < ApplicationRecord
	def initialize
	end

	def self.write_poem
		@words = Word.all.sample(500).reject{|m| m['word'].match(/[^a-z]/) }.map{|m| m.as_json.merge(syllables: self.syllables(m['word'])) }
		@words = @words.map{|m| m[:syllables] > 0 ? m : m.merge({syllables: 1})}
		
		sorted = {}

		@words.each do |hash|
			sorted[hash[:syllables]] ||= []
			sorted[hash[:syllables]] << hash['word']
		end

		if !sorted.has_key?(1)
			sorted[1] = ['a','the','of','and']
		end

		lines = [5, 7, 5]

		output = []

		lines.each do |syllables|
			invalid = 1
			while invalid
				line = ''
				while syllables > 0
					temp = sorted.reject{|k,v| k > syllables}

					syls = temp.keys[randomize.rand(temp.keys.count)]
					
					wurdz = temp[syls]
					
					line = line + ' ' + wurdz[randomize.rand(wurdz.count)]
					
					syllables -= syls
				end

				analysis = Nokogiri::XML("<sentence>" + tgr.add_tags(line) + "</sentence>")
				if analysis.xpath('//nn') != [] and analysis.xpath('//vbz') != []
					invalid = nil
				end
			end
			output << line.strip.capitalize
		end

		output.join("<br>")
	end

	def self.syllables(word)
		word.scan(/([AEIOUaeiouy]+(?!$|s$|d$))|((?<=k|v|z)[AEIOUaeiouy]+)|(ly$)|(ing$)|((?:p|b)le$)|([^AEIOUY]e(?:s|d)$)/).count
	end
end
