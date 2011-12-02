class AddPasswordColumn < ActiveRecord::Migration
  def self.up
		add_column :members, :password, :string
  end

  def self.down
  end
end
