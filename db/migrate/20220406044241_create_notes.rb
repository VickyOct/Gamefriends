class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :note
      t.string :score
      t.string :date
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
