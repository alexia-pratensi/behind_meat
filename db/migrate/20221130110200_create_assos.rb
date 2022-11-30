class CreateAssos < ActiveRecord::Migration[7.0]
  def change
    create_table :assos do |t|
      t.string :name
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
