class CreateEntrees < ActiveRecord::Migration
  def change
    create_table :entrees do |t|
    	t.column :name, :string

    	t.timestamps
    end
  end
end
