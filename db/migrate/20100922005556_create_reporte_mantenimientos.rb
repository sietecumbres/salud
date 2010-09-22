class CreateReporteMantenimientos < ActiveRecord::Migration
  def self.up
    create_table :reporte_mantenimientos do |t|
      t.integer :equipo_id
      t.date :fecha_inicio
      t.date :fecha_fin
      t.integer :tipo_mantenimiento_id
      t.text :evaluacion_diagnostico
      t.text :descripcion_servicio
      t.integer :agenda_id

      t.timestamps
    end
  end

  def self.down
    drop_table :reporte_mantenimientos
  end
end
