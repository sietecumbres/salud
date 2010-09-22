class CreatePrestadorMantenimientos < ActiveRecord::Migration
  def self.up
    create_table :prestador_mantenimientos do |t|
      t.string :empresa
      t.integer :responsable_id
      t.string :cargo
      t.string :documento

      t.timestamps
    end
  end

  def self.down
    drop_table :prestador_mantenimientos
  end
end
