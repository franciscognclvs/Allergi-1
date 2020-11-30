class CreateAllergies < ActiveRecord::Migration[6.0]
  def change
    create_table :allergies do |t|

      t.timestamps
    end
  end
end
