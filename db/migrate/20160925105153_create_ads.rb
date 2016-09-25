class CreateAds < ActiveRecord::Migration[5.0]
  def change
    create_table :ads do |t|
      t.string :title
      t.text :body
      t.string :book_title
      t.string :edition
      t.string :author
      t.string :subject
      t.string :isbn
      t.string :price
      t.string :picture
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
