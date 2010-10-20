class AddPrestadorMantenimientoReporte < ActiveRecord::Migration
  def self.up
		add_column :reporte_mantenimientos, :prestador_mantenimiento_id, :integer
  end

  def self.down
		remove_column :reporte_mantenimientos, :prestador_mantenimiento_id
  end
end
