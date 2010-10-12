class Agenda < ActiveRecord::Base
  belongs_to :equipo
  belongs_to :tipo_mantenimiento
  has_one :reporte_mantenimiento
end
