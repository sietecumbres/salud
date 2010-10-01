class Persona < ActiveRecord::Base
  has_many :equipos
  has_many :reporte_mantenimientos
end
