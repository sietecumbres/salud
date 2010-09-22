class EntregaMantenimiento < ActiveRecord::Base
  belongs_to :equipo
  belongs_to :prestador_mantenimiento
end
