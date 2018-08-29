class CreatePuntorecoleccions < ActiveRecord::Migration[5.1]
  def change
    create_table :puntorecoleccions do |t|
      t.references :zona, foreign_key: true
      t.string :nombre
      t.text :descripcion
      t.text :direccion
      t.string :latitud
      t.string :longitud

      t.timestamps
    end
  end
end
