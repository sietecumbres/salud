module HojaVidaHelper

	def build_comparative_calendar_row(equipo, tipo, year = Date.today.year)
		year = year.to_i
		str = ""

		str << "<tr><td>#{tipo.nombre}</td><td>Programado</td>"

		agendas = equipo.agendas_for_year(year).reject{|agenda| tipo != agenda.tipo_mantenimiento}
		fill_year(agendas).each do |agenda|
			str << "<td>#{agenda}</td>"
		end

		str << "</tr>"
		str << "<tr><td></td><td>Ejecutado</td>"

		fill_year_executed(agendas).each do |agenda|
			str << "<td>#{agenda}</td>"
		end

		str << "</tr>"

		str.html_safe
	end

	def fill_year(agendas)
		full = 1.upto(12).collect{|number| "" }

		agendas.each do |agenda|
			full[agenda.fecha_programacion.month - 1] << "<div class='agenda-day' style='background-color:#{agenda.tipo_mantenimiento.color};'>#{agenda.fecha_programacion.day}</div>"
		end

		full
	end

	def fill_year_executed(agendas)
		full = 1.upto(12).collect{|number| "" }

		agendas.each do |agenda|
		  unless agenda.fecha_ejecucion
		    full[agenda.fecha_programacion.month - 1] << "<div class='agenda-day' style='background-color:#{agenda.tipo_mantenimiento.color};'>NE</div>"
		  else
			  full[agenda.fecha_ejecucion.month - 1] << "<div class='agenda-day' style='background-color:#{agenda.tipo_mantenimiento.color};'>#{agenda.fecha_ejecucion.day}</div>"
			end
		end

		full
	end

end
