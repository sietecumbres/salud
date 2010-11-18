class CreateProveedorInsumos < ActiveRecord::Migration
  def self.up
    create_table :proveedor_insumos do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :proveedor_insumos
  end
end
