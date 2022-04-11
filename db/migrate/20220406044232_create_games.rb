class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :title
      t.string :genre
      t.string :platform
      t.string :short_description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
