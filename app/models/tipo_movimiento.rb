class TipoMovimiento < ActiveRecord::Base
	has_many :movimiento_insumos
end
