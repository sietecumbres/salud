class CreateInsumos < ActiveRecord::Migration
  def self.up
    create_table :insumos do |t|
      t.date :fecha_vencimiento
      t.string :lote
      t.integer :tipo_insumo_id
    end
  end

  def self.down
    drop_table :insumos
  end
end
