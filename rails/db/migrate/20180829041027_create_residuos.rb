class CreateResiduos < ActiveRecord::Migration[5.1]
  def change
    create_table :residuos do |t|
      t.references :tiporesiduo, foreign_key: true
      t.string :nombre
      t.text :descripcion

      t.timestamps
    end
  end
end
