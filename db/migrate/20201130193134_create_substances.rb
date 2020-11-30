class CreateSubstances < ActiveRecord::Migration[6.0]
  def change
    create_table :substances do |t|
      t.string :name

      t.timestamps
    end
  end
end
