class TipoMantenimiento < ActiveRecord::Base
  has_many :reporte_mantenimientos
	has_many :autoagendas
end
