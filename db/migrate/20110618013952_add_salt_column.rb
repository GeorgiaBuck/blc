class AddSaltColumn < ActiveRecord::Migration
  def self.up
		add_column :members, :salt, :string
  end

  def self.down
  end
end
