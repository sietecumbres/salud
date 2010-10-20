class AddResponsableApprovalToReporte < ActiveRecord::Migration
  def self.up
		add_column :reporte_mantenimientos, :aprobado, :boolean
  end

  def self.down
		remove_column :reporte_mantenimientos, :aprobado
  end
end
