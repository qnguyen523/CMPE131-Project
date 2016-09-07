class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.string :screen_name
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :confirm_password

      t.timestamps null: false
    end
  end
end
