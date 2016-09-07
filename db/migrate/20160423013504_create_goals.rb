class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
     # puts "******************************************"
     # puts t.methods
      t.string :Goal
      t.text :Description
      t.date :Date
      t.date :DueDate
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
