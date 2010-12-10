class AddColumnFinalizadoToReportes < ActiveRecord::Migration
  def self.up
		add_column :reporte_mantenimientos, :finalizado, :boolean
  end

  def self.down
		remove_column :reporte_mantenimientos, :finalizado
  end
end
