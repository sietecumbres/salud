class CreateAgendas < ActiveRecord::Migration
  def self.up
    create_table :agendas do |t|
      t.date :fecha_programacion
      t.date :fecha_ejecucion
      t.date :fecha_finalizacion
      t.integer :tipo_mantenimiento_id
      t.integer :equipo_id

      t.timestamps
    end
  end

  def self.down
    drop_table :agendas
  end
end
