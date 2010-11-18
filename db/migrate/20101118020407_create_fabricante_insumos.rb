class CreateFabricanteInsumos < ActiveRecord::Migration
  def self.up
    create_table :fabricante_insumos do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :fabricante_insumos
  end
end
