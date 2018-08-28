class CreateRecolectors < ActiveRecord::Migration[5.1]
  def change
    create_table :recolectors do |t|
      t.string :nombres
      t.string :apellidos
      t.date :fecha_nacimiento
      t.string :empresa

      t.timestamps
    end
  end
end
