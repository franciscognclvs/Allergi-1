class AddCrmToDoctors < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :crm, :string
  end
end
