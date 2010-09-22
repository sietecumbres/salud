class CreateTipoAdquisicions < ActiveRecord::Migration
  def self.up
    create_table :tipo_adquisicions do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :tipo_adquisicions
  end
end
