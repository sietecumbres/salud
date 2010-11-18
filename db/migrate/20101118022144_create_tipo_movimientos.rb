class CreateTipoMovimientos < ActiveRecord::Migration
  def self.up
    create_table :tipo_movimientos do |t|
      t.string :nombre
    end
  end

  def self.down
    drop_table :tipo_movimientos
  end
end
