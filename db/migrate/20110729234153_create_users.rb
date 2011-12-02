class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :name
      t.string :spouse
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :telephone
      t.string :cellphone
      t.string :occupation
      t.string :image
      t.string :email
      t.string :date_joined
      t.string :password
      t.string :hashed_password
      t.string :salt
      t.text :remarks
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
