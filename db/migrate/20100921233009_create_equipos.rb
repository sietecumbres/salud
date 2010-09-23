class CreateEquipos < ActiveRecord::Migration
  def self.up
    create_table :equipos do |t|
      t.integer :area_id
      t.integer :tipo_equipo_id
      t.integer :subtipo_equipo_id
      t.string :modelo
      t.string :marca
      t.string :serial
      t.string :placa
      t.integer :tipo_adquisicion_id
      t.float :valor
      t.integer :responsable_id

      t.timestamps
    end
  end

  def self.down
    drop_table :equipos
  end
end
