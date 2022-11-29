class CreateMeats < ActiveRecord::Migration[7.0]
  def change
    create_table :meats do |t|
      t.string :type
      t.float :water_impact
      t.float :carbon_impact
      t.integer :tree_impact
      t.integer :animal_impact

      t.timestamps
    end
  end
end
