class CreateConsos < ActiveRecord::Migration[7.0]
  def change
    create_table :consos do |t|
      t.integer :quantity
      t.references :day, null: false, foreign_key: true
      t.references :meat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
