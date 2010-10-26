class AddLaboratorioColumnToArea < ActiveRecord::Migration
  def self.up
		add_column :areas, :laboratorio_id, :integer
  end

  def self.down
		remove_column :areas, :laboratorio_id
  end
end
