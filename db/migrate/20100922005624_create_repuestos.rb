class CreateRepuestos < ActiveRecord::Migration
  def self.up
    create_table :repuestos do |t|
      t.string :referencia
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :repuestos
  end
end
