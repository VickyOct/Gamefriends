class CreatePersonalInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :personal_infos do |t|
      t.integer :age
      t.string :country
      t.integer :phone
      t.string :twitter
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
