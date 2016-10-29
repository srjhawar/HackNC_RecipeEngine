class AddColumnsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string
    add_column :users, :country, :string
    add_column :users, :phone, :string

    add_index :users, :name

  end

  def self.down
    remove_column :users, :name
    remove_column :users, :country
    remove_column :users, :phone

    remove_index :users, :name
  end
end
