class ChangeTypeIntegerToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column :meats, :tree_impact, :float
    change_column :meats, :pollution_impact, :float
  end
end
