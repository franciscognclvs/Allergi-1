class AddLaboratoryToMedicines < ActiveRecord::Migration[6.0]
  def change
    add_column :medicines, :laboratory, :string
  end
end
