class Autoagenda < ActiveRecord::Base


	def self.years
		all.collect{|agenda| agenda.ano }
	end

	def self.anios_disponibles
		actual = Date.today.year
		(actual...(actual + 30)).reject{|year| years.include? year}
	end

end
