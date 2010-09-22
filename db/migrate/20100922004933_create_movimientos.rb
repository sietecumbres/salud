class CreateMovimientos < ActiveRecord::Migration
  def self.up
    create_table :movimientos do |t|
      t.string :origen
      t.string :destino
      t.date :fecha_movimiento
      t.text :observaciones

      t.timestamps
    end
  end

  def self.down
    drop_table :movimientos
  end
end
