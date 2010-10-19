module HojaVidaHelper

	def build_equipo_calendar_row(equipo, year = Date.today.year)
		str = ""

		equipo.tipos_mantenimiento.each do |tipo|
			str << "<tr><td>#{tipo.nombre}</td><td>P</td>"

			agendas_prev = equipo.agendas_for_year(year).reject{|agenda_prev| tipo != agenda_prev.tipo_mantenimiento}
			fill_year(agendas_prev).each do |agenda_prev|
				str << "<td>#{agenda_prev}</td>"
			end

			str << "</tr>"
			str << "<tr><td></td><td>E</td>"

			agendas_eje = equipo.agendas_for_year_eje(year).reject{|agenda_eje| tipo != agenda_eje.tipo_mantenimiento}
			fill_year_eje(agendas_eje).each do |agenda_eje|
				str << "<td>#{agenda_eje}</td>"
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

	def fill_year_eje(agendas)
		full = 1.upto(12).collect{|number| "" }

		agendas.each do |agenda|
			full[agenda.fecha_ejecucion.month - 1] << "<div class='agenda-day' style='background-color:#{agenda.tipo_mantenimiento.color};'>#{agenda.fecha_ejecucion.day}</div>"
		end

		full
	end

end
