class CreateGenresUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :genres_users, id: false do |t|
      t.references :user, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
