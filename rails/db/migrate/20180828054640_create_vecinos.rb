class CreateVecinos < ActiveRecord::Migration[5.1]
  def change
    create_table :vecinos do |t|
      t.string :documento
      t.string :nombres
      t.string :apellidos
      t.date :fecha_nacimiento
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
