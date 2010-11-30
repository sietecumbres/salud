class TipoInsumo < ActiveRecord::Base
	has_many :tipos_insumo_pruebas
	has_many :almacenamientos
	has_many :insumos
	belongs_to :fabricante_insumo
	belongs_to :proveedor_insumo
	belongs_to :alerta_cantidad, :class_name => "AlertaCantidad"
	belongs_to :alerta_vencimiento, :class_name => "AlertaVencimiento"
end
