class ChangeNameAnimalToPollution < ActiveRecord::Migration[7.0]
  def change
    rename_column :meats, :animal_impact, :pollution_impact
  end
end
