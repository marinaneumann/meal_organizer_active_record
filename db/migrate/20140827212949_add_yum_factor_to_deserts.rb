class AddYumFactorToDeserts < ActiveRecord::Migration
  def change
  	add_column :deserts, :yum_factor, :integer
  end
end
