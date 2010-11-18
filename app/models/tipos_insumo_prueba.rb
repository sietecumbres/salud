class TiposInsumoPrueba < ActiveRecord::Base
	belongs_to :prueba
	belongs_to :tipo_insumo
end
