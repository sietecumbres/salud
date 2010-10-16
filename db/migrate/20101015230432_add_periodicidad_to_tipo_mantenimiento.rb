class AddPeriodicidadToTipoMantenimiento < ActiveRecord::Migration
  def self.up
		add_column :tipo_mantenimientos, :periodicidad, :integer
  end

  def self.down
		remove_column :tipo_mantenimientos, :periodicidad
  end
end
