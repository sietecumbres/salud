class CreateAlmacenamientos < ActiveRecord::Migration
  def self.up
    create_table :almacenamientos do |t|
      t.string :zona
      t.string :vitrina
      t.string :posicion
      t.integer :insumo_id
    end
  end

  def self.down
    drop_table :almacenamientos
  end
end
