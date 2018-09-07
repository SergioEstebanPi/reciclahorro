class CreateOfertasProductos < ActiveRecord::Migration[5.1]
  def change
    create_table :ofertas_productos do |t|
      t.references :oferta, foreign_key: true
      t.references :producto, foreign_key: true

      t.timestamps
    end
  end
end
