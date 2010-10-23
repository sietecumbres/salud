class CreateLaboratorios < ActiveRecord::Migration
  def self.up
    create_table :laboratorios do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :laboratorios
  end
end
