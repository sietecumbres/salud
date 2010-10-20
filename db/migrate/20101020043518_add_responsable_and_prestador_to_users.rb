class AddResponsableAndPrestadorToUsers < ActiveRecord::Migration
  def self.up
		#fields for PrestadorMantenimiento
		add_column :users, :empresa, :string

		#fields for Responsable and PrestadorMantenimiento
		add_column :users, :nombre, :string
		add_column :users, :cargo, :string
		add_column :users, :documento, :string
  end

  def self.down
		remove_column(:users, :nombre, :cargo, :documento, :empresa)
  end
end
