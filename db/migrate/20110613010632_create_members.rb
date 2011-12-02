class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :last_name
      t.string :first_name
      t.string :address_id
      t.string :email
      t.string :spouse_id
      t.string :image_id
      t.string :telephone_id
      t.timestamps
    end

  end

  def self.down
    drop_table :members
  end
end
