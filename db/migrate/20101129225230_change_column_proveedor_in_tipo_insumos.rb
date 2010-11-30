class ChangeColumnProveedorInTipoInsumos < ActiveRecord::Migration
  def self.up
		remove_column :tipo_insumos, :proveedor_id
		add_column :tipo_insumos, :proveedor_insumo_id, :integer
  end

  def self.down
	remove_column :tipo_insumos, :proveedor_insumo_id
	add_column :tipo_insumos, :proveedor_id, :integer
  end
end
