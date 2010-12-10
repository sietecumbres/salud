class AddColumnTypeToProveedors < ActiveRecord::Migration
  def self.up
		add_column :proveedors, :type, :string
  end

  def self.down
		remove_column :proveedors, :type
  end
end
