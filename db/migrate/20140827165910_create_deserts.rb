class CreateDeserts < ActiveRecord::Migration
  def change
    create_table :deserts do |t|
    	t.column :name, :string

    	t.timestamps
    end
  end
end
