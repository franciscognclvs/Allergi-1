class AddNameToMedicines < ActiveRecord::Migration[6.0]
  def change
    add_column :medicines, :name, :string
  end
end
