class AddColorToTipoMantenimiento < ActiveRecord::Migration
  def self.up
    add_column :tipo_mantenimientos, :color, :string
  end

  def self.down
    remove_column :tipo_mantenimientos, :color
  end
end
