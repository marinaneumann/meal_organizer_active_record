class DropDesertIdFromMeals < ActiveRecord::Migration
  def change
  	remove_column :meals, :desert_id, :int
  	add_column :meals, :dessert_id, :int
  end
end
