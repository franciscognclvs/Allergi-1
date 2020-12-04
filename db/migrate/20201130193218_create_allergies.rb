class CreateAllergies < ActiveRecord::Migration[6.0]
  def change
    create_table :allergies do |t|
      t.string :reactions
      t.string :medicine_name
      t.references :user, foreign_key: true
      t.references :substance, foreign_key: true

      t.timestamps
    end
  end
end
