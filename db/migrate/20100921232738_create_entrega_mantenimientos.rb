class CreateEntregaMantenimientos < ActiveRecord::Migration
  def self.up
    create_table :entrega_mantenimientos do |t|
      t.integer :equipo_id
      t.integer :prestador_mantenimiento_id

      t.timestamps
    end
  end

  def self.down
    drop_table :entrega_mantenimientos
  end
end
