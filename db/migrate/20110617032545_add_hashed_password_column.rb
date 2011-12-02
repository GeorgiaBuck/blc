class AddHashedPasswordColumn < ActiveRecord::Migration
  def self.up
		add_column :members, :hashed_password, :string
  end

  def self.down
  end
end
