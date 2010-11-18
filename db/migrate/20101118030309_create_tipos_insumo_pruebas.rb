class CreateTiposInsumoPruebas < ActiveRecord::Migration
  def self.up
    create_table :tipos_insumo_pruebas do |t|
      t.integer :prueba_id
      t.integer :tipo_insumo_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tipos_insumo_pruebas
  end
end
