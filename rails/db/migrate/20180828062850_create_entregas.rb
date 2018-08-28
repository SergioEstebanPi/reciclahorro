class CreateEntregas < ActiveRecord::Migration[5.1]
  def change
    create_table :entregas do |t|
      t.references :vecino, foreign_key: true
      t.references :recolector, foreign_key: true
      t.string :estado
      t.float :peso

      t.timestamps
    end
  end
end
