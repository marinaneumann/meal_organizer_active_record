class CreateDesserts < ActiveRecord::Migration
  def change
    create_table :desserts do |t|
    	t.column :name, :string
    	t.column :yum_factor, :int

    	t.timestamps
    end
  end
end
