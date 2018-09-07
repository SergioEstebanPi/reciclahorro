class CreateSectors < ActiveRecord::Migration[5.1]
  def change
    create_table :sectors do |t|
      t.string :nombre
      t.text :descripcion
      t.numeric :tipo

      t.timestamps
    end
  end
end
