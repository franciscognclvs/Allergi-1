class CreateMedicines < ActiveRecord::Migration[6.0]
  def change
    create_table :medicines do |t|
      t.string :name
      t.string :principle
      t.string :laboratory
      t.string :medicine_code

      t.timestamps
    end
  end
end
