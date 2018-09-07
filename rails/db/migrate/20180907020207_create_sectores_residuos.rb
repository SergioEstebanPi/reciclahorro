class CreateSectoresResiduos < ActiveRecord::Migration[5.1]
  def change
    create_table :sectores_residuos do |t|
      t.references :sector, foreign_key: true
      t.references :residuo, foreign_key: true
      
      t.timestamps
    end
  end
end
