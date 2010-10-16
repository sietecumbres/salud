class AddTipoMantenimientoFieldToAutogenerar < ActiveRecord::Migration
  def self.up
		add_column :autoagendas, :tipo_mantenimiento_id, :integer
  end

  def self.down
		remove_column(:autoagendas, :tipo_mantenimiento_id)
  end
end
