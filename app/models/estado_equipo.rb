class EstadoEquipo < ActiveRecord::Base
  belongs_to :reporte_mantenimiento
  belongs_to :estado 
end
