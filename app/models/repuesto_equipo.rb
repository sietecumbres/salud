class RespuestoEquipo < ActiveRecord::Base
  belongs_to :equipo
  belongs_to :repuesto
end
