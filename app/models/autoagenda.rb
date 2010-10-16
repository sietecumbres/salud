class Autoagenda < ActiveRecord::Base
	belongs_to :tipo_mantenimiento

	def self.tipo_mantenimiento_disponibles(year)
		unavailable = where(:ano => year).collect{|agenda| agenda.tipo_mantenimiento_id}
		TipoMantenimiento.all.reject{|tipo| unavailable.include?(tipo.id)}
	end

	def self.years(tipo_mantenimiento)
		auto = all.collect{|agenda| agenda }
		agendas = auto.reject { |agenda| agenda.tipo_mantenimiento_id != tipo_mantenimiento }
		result = agendas.collect { |agenda| agenda.ano }
		Rails.logger.debug "result => #{result.inspect}"
		result
	end

	def self.anios_disponibles(tipo_mantenimiento)
		actual = Date.today.year
		years = years(tipo_mantenimiento)
		(actual...(actual + 15)).reject{|year| years.include? year}
	end

end
