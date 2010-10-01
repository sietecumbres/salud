class RepuestoEquipo < ActiveRecord::Base
  belongs_to :reporte_mantenimiento
  belongs_to :repuesto
end
