class AddColumnAreaToMovimientoEquipos < ActiveRecord::Migration
  def self.up
		add_column :movimiento_equipos, :area_id, :integer
		remove_column :movimiento_equipos, :laboratorio_id
		add_column :movimiento_equipos, :laboratorio, :string
  end

  def self.down
		remove_column :movimiento_equipos, :area_id
		add_column :movimiento_equipos, :laboratorio_id, :integer
		remove_column :movimiento_equipos, :laboratorio
  end
end
