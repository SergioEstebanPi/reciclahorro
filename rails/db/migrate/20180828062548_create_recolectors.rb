class CreateRecolectors < ActiveRecord::Migration[5.1]
  def change
    create_table :recolectors do |t|
      t.string :empresa
      t.string  :doc_identidad, null: false
      t.references :usuario, foreign_key: true
      
      t.timestamps
    end
  end
end
