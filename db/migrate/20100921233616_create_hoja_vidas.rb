class CreateHojaVidas < ActiveRecord::Migration
  def self.up
    create_table :hoja_vidas do |t|
      t.integer :equipo_id
      t.date :fecha_compra
      t.date :fecha_instalacion
      t.integer :fabricante_id
      t.integer :proveedor_id
      t.date :garantia
      t.boolean :manual_operacion
      t.float :voltaje
      t.float :amperaje
      t.float :potencia
      t.float :frecuencia

      t.timestamps
    end
  end

  def self.down
    drop_table :hoja_vidas
  end
end
