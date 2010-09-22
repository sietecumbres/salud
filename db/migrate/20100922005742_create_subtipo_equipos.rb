class CreateSubtipoEquipos < ActiveRecord::Migration
  def self.up
    create_table :subtipo_equipos do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :subtipo_equipos
  end
end
