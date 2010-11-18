class ChangePersonaUserMovimientoInsumos < ActiveRecord::Migration
  def self.up
		remove_column :movimiento_insumos, :persona_id
		add_column :movimiento_insumos, :user_id, :integer
  end

  def self.down
		add_column :movimiento_insumos, :persona_id, :integer
		remove_column :movimiento_insumos, :user_id
  end
end
