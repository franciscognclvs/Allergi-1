class AddReactionToAlergies < ActiveRecord::Migration[6.0]
  def change
    add_column :allergies, :reaction, :string
  end
end
