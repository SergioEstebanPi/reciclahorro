class CreateOferta < ActiveRecord::Migration[5.1]
  def change
    create_table :oferta do |t|
      t.references :almacen, foreign_key: true
      t.references :residuo, foreign_key: true
      t.string :titulo
      t.text :descripcion
      t.numeric :descuento
      t.numeric :estado
      t.numeric :peso
      t.numeric :cantidad

      t.timestamps
    end
  end
end
