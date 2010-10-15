class Agenda < ActiveRecord::Base
  belongs_to :equipo
  belongs_to :tipo_mantenimiento
  has_one :reporte_mantenimiento

	order('fecha_programacion ASC')

	def self.generate_agendas(equipos, periodicidad, tipo_mantenimiento, desde = Date.today)
		1.upto(12 / periodicidad) do |periodo|
			actual = valid_date(desde)
			equipos.in_groups_of(3) do |group|
				group.each do |equipo|
					if equipo then
						agenda = Agenda.new
						agenda.equipo_id = equipo.id
						agenda.fecha_programacion = actual
						agenda.tipo_mantenimiento_id = tipo_mantenimiento
						agenda.save
					end
				end
				actual = actual + 1.day
			end
			desde = desde + periodicidad.months
		end
	end

	def self.valid_date(date)
		jd = Date.civil_to_jd(date.year, date.month, date.day)
		day = Date.jd_to_wday(jd)

		while day == 6 or day == 0 do
			date = date + 1.day
			jd = Date.civil_to_jd(date.year, date.month, date.day)
			day = Date.jd_to_wday(jd)
		end

		date
	end
end
