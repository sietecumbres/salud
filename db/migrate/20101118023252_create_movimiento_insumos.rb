class CreateMovimientoInsumos < ActiveRecord::Migration
  def self.up
    create_table :movimiento_insumos do |t|
      t.integer :insumo_id
      t.float :cantidad
      t.string :unidad
      t.integer :area_id
      t.integer :laboratorio_id
      t.date :fecha
      t.integer :tipo_movimiento_id
      t.integer :persona_id
    end
  end

  def self.down
    drop_table :movimiento_insumos
  end
end
