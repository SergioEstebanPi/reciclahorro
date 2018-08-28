class CreateSolicitud < ActiveRecord::Migration[5.1]
  def change
    create_table :solicitud do |t|
      t.string :titulo
      t.text :descripcion
      t.date :fecha_recoleccion
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
