class CreateAllergiesReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :allergies_reactions do |t|
      t.references :allergy, foreign_key: true
      t.references :reaction, foreign_key: true
      t.timestamps
    end
  end
end
