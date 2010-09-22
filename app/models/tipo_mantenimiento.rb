class TipoMantenimiento < ActiveRecord::Base
  has_many :reporte_mantenimientos
end
