class CreateComentarios < ActiveRecord::Migration[5.1]
  def change
    create_table :comentarios do |t|
      t.references :usuario, foreign_key: true
      t.references :publicacion, foreign_key: true
      t.text :descripcion

      t.timestamps
    end
  end
end
