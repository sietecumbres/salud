class ReporteMantenimiento < ActiveRecord::Base
  belongs_to :equipo
  belongs_to :agenda
  belongs_to :tipo_mantenimiento
  belongs_to :responsable, :class_name => "Persona"
  has_one :prestador_mantenimiento
  has_many :entrega_mantenimientos
  has_many :estado_equipos
  has_many :repuesto_equipos
end
