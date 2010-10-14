class Equipo < ActiveRecord::Base
  belongs_to :area
  belongs_to :responsable, :class_name => "Persona"
  belongs_to :subtipo_equipo
  belongs_to :tipo_adquisicion
  belongs_to :tipo_equipo
  has_one :hoja_vida
  has_many :estado_equipos
  has_many :movimientos
  has_many :reporte_mantenimientos
	has_many :agendas

	scope :bajo_riesgo, where('tipo_equipo_id = ?', 3)
	scope :moderado_riesgo, where('tipo_equipo_id = ?', 2)
	scope :alto_riesgo, where('tipo_equipo_id = ?', 1)

	def agendas_for_year(year)
		self.agendas.reject{|agenda| agenda.fecha_programacion.year != year}.sort_by { |agenda| agenda.fecha_programacion.month }
	end

	def tipos_mantenimiento
		self.agendas.select(:tipo_mantenimiento_id).group(:tipo_mantenimiento_id).collect{|agenda| agenda.tipo_mantenimiento}
	end
	
end
