class CreateFabricantes < ActiveRecord::Migration
  def self.up
    create_table :fabricantes do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :fabricantes
  end
end
