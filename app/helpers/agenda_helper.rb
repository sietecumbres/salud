module AgendaHelper

	def build_calendar_row(equipos, year = Date.today.year)
		year = year.to_i
		str = ""

		equipos.each do |equipo|
			str << "<tr><td>#{equipo.placa}</td>"

			fill_year(equipo.agendas_for_year(year)).each do |agenda|
				str << "<td>#{agenda}</td>"
			end
			str << "</tr>"
		end
		
		str.html_safe
	end

	def build_equipo_calendar_row(equipo, year = Date.today.year)
		year = year.to_i
		str = ""

		equipo.tipos_mantenimiento.each do |tipo|
			str << "<tr><td>#{tipo.nombre}</td>"

			agendas = equipo.agendas_for_year(year).reject{|agenda| tipo != agenda.tipo_mantenimiento}
			fill_year(agendas).each do |agenda|
				str << "<td>#{agenda}</td>"
			end

			str << "</tr>"
		end

		str.html_safe
	end

	def fill_year(agendas)
		full = 1.upto(12).collect{|number| "" }

		agendas.each do |agenda|
			full[agenda.fecha_programacion.month - 1] << "<div class='agenda-day' style='background-color:#{agenda.tipo_mantenimiento.color};'>#{agenda.fecha_programacion.day}</div>"
		end

		full
	end

end
