class CreateAutoagendas < ActiveRecord::Migration
  def self.up
    create_table :autoagendas, :id => false do |t|
      t.integer :ano
    end
  end

  def self.down
    drop_table :autoagendas
  end
end
