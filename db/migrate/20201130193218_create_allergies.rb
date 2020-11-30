class CreateAllergies < ActiveRecord::Migration[6.0]
  def change
    create_table :allergies do |t|
      t.string :reactions
      t.string :medicine_name
      t.references :user, null: false, foreign_key: true
      t.references :substance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
