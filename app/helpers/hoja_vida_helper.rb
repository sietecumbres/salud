module HojaVidaHelper

	def build_equipo_calendar_row(equipo, year = Date.today.year)
		str = ""

		equipo.tipos_mantenimiento.each do |tipo|
			str << "<tr><td>#{tipo.nombre}</td><td>P</td>"

			agendas_prev = equipo.agendas_for_year(year).reject{|agenda| tipo != agenda.tipo_mantenimiento}
			fill_year(agendas_prev).each do |agenda|
				str << "<td>#{agenda}</td>"
			end

			str << "</tr>"
			str << "<tr><td></td><td>E</td>"

			agendas_eje = equipo.agendas_for_year_eje(year).reject{|agenda| tipo != agenda.tipo_mantenimiento}
			fill_year(agendas_eje).each do |agenda|
				str << "<td>#{agenda}</td>"
			end

			str << "</tr>"
		end

		str.html_safe
	end

end
