class EstadoEquipo < ActiveRecord::Base
  belongs_to :equipo
  belongs_to :estado 
end
