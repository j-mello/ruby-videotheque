class CreateGenre < ActiveRecord::Migration[6.0]
  def change
    create_table :genres do |t|
      t.string :name
      t.string :timestamp
    end
  end
end
