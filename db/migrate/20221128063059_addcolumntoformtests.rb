class Addcolumntoformtests < ActiveRecord::Migration[7.0]
  def change
     add_column :formtests, :pet_cat, :boolean, default: false
     add_column :formtests, :pet_dog, :boolean, default: false

  end
end
