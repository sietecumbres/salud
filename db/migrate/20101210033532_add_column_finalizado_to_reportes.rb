class AddColumnFinalizadoToReportes < ActiveRecord::Migration
  def self.up
		add_column :reporte_mantenimientos, :finalizado, :string
  end

  def self.down
		remove column :reporte_mantenimientos, :finalizado
  end
end
