class CreateFormtests < ActiveRecord::Migration[7.0]
  def change
    create_table :formtests do |t|
      t.text :name
      t.references :article, null: false, foreign_key: true
      t.text :message
      t.integer :password
      t.integer :price
      t.integer :disscount
      t.date :born_on
      t.time :started_at
      t.datetime :graduation_day
      t.string :birthday_month
      t.string :birthday_week
      t.string :address
      t.string :phone
      t.string :hompage
      t.string :favorite_color
      t.timestamps
    end
  end
end
