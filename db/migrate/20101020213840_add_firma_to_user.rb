class AddFirmaToUser < ActiveRecord::Migration
  def self.up
		add_column :users, :firma, :string
  end

  def self.down
		remove_column :users, :firma
  end
end
