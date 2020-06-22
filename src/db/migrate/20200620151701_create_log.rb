class CreateLog < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.date :dateEmprunt
      t.date :dateRetour
      t.string :etat
      t.belongs_to :film, null: false, foreign_key: true
      t.integer :user_id1
      t.integer :user_id2
    end
  end
end
