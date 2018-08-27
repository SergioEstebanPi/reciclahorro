class CreateVecinos < ActiveRecord::Migration[5.1]
  def change
    create_table :vecinos do |t|
      t.string :nombre
      t.string :apellido
      t.text :direccion
      t.date :fecha_nacimiento
      t.timestamps
    end
  end
end
