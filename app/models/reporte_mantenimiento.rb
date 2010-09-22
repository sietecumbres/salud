class ReporteMantenimiento < ActiveRecord::Base
  belongs_to :equipo
  belongs_to :agenda
  belongs_to :tipo_mantenimiento
end
