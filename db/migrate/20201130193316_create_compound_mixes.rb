class CreateCompoundMixes < ActiveRecord::Migration[6.0]
  def change
    create_table :compound_mixes do |t|
      t.references :medicine, null: false, foreign_key: true
      t.references :substance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
