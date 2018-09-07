class CreateProductos < ActiveRecord::Migration[5.1]
  def change
    create_table :productos do |t|
      t.references :tipoproducto, foreign_key: true
      t.string :nombre
      t.text :descripcion
      t.numeric :precio
      t.string :tipo

      t.timestamps
    end
  end
end
