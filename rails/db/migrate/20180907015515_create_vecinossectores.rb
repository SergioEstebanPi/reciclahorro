class CreateVecinossectores < ActiveRecord::Migration[5.1]
  def change
    create_table :vecinossectores do |t|
      t.references :vecino, foreign_key: true
      t.references :sector, foreign_key: true
      
      t.timestamps
    end
  end
end
