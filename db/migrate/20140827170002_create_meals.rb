class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
    	t.column :entree_id, :int
    	t.column :desert_id, :int

    	t.timestamps
    end
  end
end
