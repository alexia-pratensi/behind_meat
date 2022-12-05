class ChangeNameAnimalToPollutionUser < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :animal, :pollution
  end
end
