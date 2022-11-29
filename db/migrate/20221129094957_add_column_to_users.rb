class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :water, :float
    add_column :users, :carbon, :float
    add_column :users, :tree, :integer
    add_column :users, :animal, :integer
  end
end
