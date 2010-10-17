class Agenda < ActiveRecord::Base
  belongs_to :equipo
  belongs_to :tipo_mantenimiento
  has_one :reporte_mantenimiento

	order('fecha_programacion ASC')

	def self.next_agenda(equipo, fecha = Date.today)
		where('equipo_id = ? AND fecha_programacion > ?', equipo, fecha).order('fecha_programacion').first
	end

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

		available = date_available(date)

		while day == 6 or day == 0 or !available do
			date = date + 1.day
			jd = Date.civil_to_jd(date.year, date.month, date.day)
			day = Date.jd_to_wday(jd)
			available = date_available(date)
		end

		date
	end

	def self.date_available(date)
		where(:fecha_programacion => date).count < 3
	end
end
