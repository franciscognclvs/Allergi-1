class AddPrincipleingredientToMedicines < ActiveRecord::Migration[6.0]
  def change
    add_column :medicines, :principleingredient, :string
  end
end
