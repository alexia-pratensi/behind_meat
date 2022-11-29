class ChangeColumnTypeToMeatType < ActiveRecord::Migration[7.0]
  def change
    rename_column :meats, :type, :meat_type
  end
end
