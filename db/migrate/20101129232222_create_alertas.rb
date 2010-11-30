class CreateAlertas < ActiveRecord::Migration
  def self.up
    create_table :alertas do |t|
      t.string :type
      t.float :cantidad_minima
      t.integer :dias_minimos
    end

		add_column :tipo_insumos, :alerta_cantidad_id, :integer
		add_column :tipo_insumos, :alerta_vencimiento_id, :integer
  end

  def self.down
		remove_column :tipo_insumos, :alerta_cantidad_id
		remove_column :tipo_insumos, :alerta_vencimiento_id
    drop_table :alertas
  end
end
