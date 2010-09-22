class CreateRepuestoEquipos < ActiveRecord::Migration
  def self.up
    create_table :repuesto_equipos do |t|
      t.integer :equipo_id
      t.integer :repuesto_id
      t.integer :cantidad

      t.timestamps
    end
  end

  def self.down
    drop_table :repuesto_equipos
  end
end
