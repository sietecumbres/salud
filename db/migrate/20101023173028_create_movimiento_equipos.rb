class CreateMovimientoEquipos < ActiveRecord::Migration
  def self.up
    create_table :movimiento_equipos do |t|
      t.integer :equipo_id
      t.integer :laboratorio_id
      t.date :fecha_movimiento
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :movimiento_equipos
  end
end
