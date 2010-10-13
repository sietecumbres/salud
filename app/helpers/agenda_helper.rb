module AgendaHelper

	def build_calendar_row(equipos)
		str = ""

		equipos.each do |equipo|
			str << "<tr><td>#{equipo.placa}</td>"

			fill_year(equipo.agendas_for_year(2010)).each do |agenda|
				str << "<td>#{agenda}</td>"
			end
			str << "</tr>"
		end
		
		str.html_safe
	end

	def fill_year(agendas)
		full = 1.upto(12).collect{|number| "" }

		agendas.each do |agenda|
			full[agenda.fecha_programacion.month - 1] << "<div class='#{agenda.tipo_mantenimiento.nombre}'>#{agenda.fecha_programacion.day}</div>"
		end

		full
	end

end
