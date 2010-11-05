class TipoMantenimiento < ActiveRecord::Base
  has_many :reporte_mantenimientos, :dependent => :destroy
	has_many :autoagendas, :dependent => :destroy
end
