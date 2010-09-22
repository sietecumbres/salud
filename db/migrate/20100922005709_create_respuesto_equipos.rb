class CreateRespuestoEquipos < ActiveRecord::Migration
  def self.up
    create_table :respuesto_equipos do |t|
      t.integer :equipo_id
      t.integer :repuesto_id
      t.integer :cantidad

      t.timestamps
    end
  end

  def self.down
    drop_table :respuesto_equipos
  end
end
