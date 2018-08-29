class CreateAlmacens < ActiveRecord::Migration[5.1]
  def change
    create_table :almacens do |t|
      t.references :tipoalmacen, foreign_key: true
      t.string :nombre
      t.text :descripcion
      t.string :direccion
      t.string :latitud
      t.string :longitud

      t.timestamps
    end
  end
end
