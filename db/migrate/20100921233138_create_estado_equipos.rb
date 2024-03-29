class CreateEstadoEquipos < ActiveRecord::Migration
  def self.up
    create_table :estado_equipos do |t|
      t.integer :estado_id
      t.integer :reporte_mantenimiento_id
      t.string :resultado
      t.text :evaluacion

      t.timestamps
    end
  end

  def self.down
    drop_table :estado_equipos
  end
end
