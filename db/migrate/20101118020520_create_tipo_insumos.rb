class CreateTipoInsumos < ActiveRecord::Migration
  def self.up
    create_table :tipo_insumos do |t|
      t.string :nombre
      t.integer :fabricante_insumo_id
      t.string :presentacion
      t.integer :proveedor_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tipo_insumos
  end
end
